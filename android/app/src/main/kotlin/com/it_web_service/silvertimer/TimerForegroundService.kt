package com.it_web_service.silvertimer

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat

/**
 * Foreground Service that shows a persistent countdown notification on the
 * Android lock screen and notification shade while the SilverTimer is running.
 *
 * The notification uses Android's built-in Chronometer widget set to count
 * down to [endAtMs], so the OS handles per-second UI updates automatically
 * — no Flutter ticker involvement needed.
 *
 * Flutter communicates via MethodChannel in [MainActivity]. Notification
 * action buttons (Pause / Resume) send local broadcasts that MainActivity
 * forwards back to Flutter via EventChannel.
 *
 * Play Store note: this service declares foregroundServiceType="specialUse".
 * When submitting to Google Play, provide justification in the declaration
 * form: "Electrolysis timer that must remain visible on the lock screen to
 * show live countdown and electrode cleaning reminders."
 */
class TimerForegroundService : Service() {

    // -------------------------------------------------------------------------
    // Constants
    // -------------------------------------------------------------------------
    companion object {
        /** MethodChannel action strings (sent via Intent.action from MainActivity). */
        const val ACTION_START  = "com.it_web_service.silvertimer.START_TIMER"
        const val ACTION_PAUSE  = "com.it_web_service.silvertimer.PAUSE_TIMER"
        const val ACTION_UPDATE = "com.it_web_service.silvertimer.UPDATE_TIMER"
        const val ACTION_STOP   = "com.it_web_service.silvertimer.STOP_TIMER"

        /** Broadcasts sent to MainActivity when notification buttons are tapped. */
        const val BROADCAST_PAUSE  = "com.it_web_service.silvertimer.NOTIFICATION_PAUSE"
        const val BROADCAST_RESUME = "com.it_web_service.silvertimer.NOTIFICATION_RESUME"

        /** Intent extra keys. */
        const val EXTRA_END_AT_MS         = "endAtMs"
        const val EXTRA_TOTAL_DURATION_MS = "totalDurationMs"
        const val EXTRA_TARGET_PPM        = "targetPpm"
        const val EXTRA_NEXT_CLEANING_AT  = "nextCleaningAtMs"
        const val EXTRA_REMAINING_MS      = "remainingMs"

        private const val NOTIFICATION_ID = 1002
        const val CHANNEL_ID = "silvertimer_timer_fg"

        private const val REQ_OPEN   = 10
        private const val REQ_PAUSE  = 11
        private const val REQ_RESUME = 12
    }

    // -------------------------------------------------------------------------
    // State
    // -------------------------------------------------------------------------
    private var endAtMs: Long        = 0L
    private var totalDurationMs: Long = 1L
    private var targetPpm: Double    = 0.0
    private var nextCleaningAtMs: Long? = null
    private var isPaused: Boolean    = false
    private var remainingMs: Long    = 0L

    // -------------------------------------------------------------------------
    // Service lifecycle
    // -------------------------------------------------------------------------
    override fun onBind(intent: Intent?): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START, ACTION_UPDATE -> {
                endAtMs          = intent.getLongExtra(EXTRA_END_AT_MS, 0L)
                totalDurationMs  = intent.getLongExtra(EXTRA_TOTAL_DURATION_MS, 1L)
                    .coerceAtLeast(1L)
                targetPpm        = intent.getDoubleExtra(EXTRA_TARGET_PPM, 0.0)
                nextCleaningAtMs = if (intent.hasExtra(EXTRA_NEXT_CLEANING_AT))
                    intent.getLongExtra(EXTRA_NEXT_CLEANING_AT, 0L)
                else null
                isPaused = false
                updateNotification()
            }
            ACTION_PAUSE -> {
                remainingMs = intent.getLongExtra(EXTRA_REMAINING_MS, 0L)
                targetPpm   = intent.getDoubleExtra(EXTRA_TARGET_PPM, 0.0)
                isPaused    = true
                updateNotification()
            }
            ACTION_STOP -> {
                stopForeground(STOP_FOREGROUND_REMOVE)
                stopSelf()
                return START_NOT_STICKY
            }
        }
        return START_NOT_STICKY
    }

    // -------------------------------------------------------------------------
    // Notification
    // -------------------------------------------------------------------------
    private fun updateNotification() {
        val notification = buildNotification()
        // Call startForeground on every update so the notification refreshes.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            // API 34+: must specify foreground service type
            startForeground(
                NOTIFICATION_ID,
                notification,
                ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE,
            )
        } else {
            startForeground(NOTIFICATION_ID, notification)
        }
    }

    private fun buildNotification(): Notification {
        val contentTitle = "SilverTimer – ${targetPpm.toInt()} PPM"

        // Tapping the notification opens the app
        val openPendingIntent = PendingIntent.getActivity(
            this,
            REQ_OPEN,
            packageManager.getLaunchIntentForPackage(packageName),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )

        // TODO: replace android.R.drawable.ic_popup_reminder with a proper
        //       monochrome notification icon in res/drawable/ic_notification.xml
        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(android.R.drawable.ic_popup_reminder)
            .setContentTitle(contentTitle)
            .setOngoing(true)
            .setAutoCancel(false)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setContentIntent(openPendingIntent)
            .setCategory(NotificationCompat.CATEGORY_ALARM)

        if (isPaused) {
            // Static display: show remaining time as subtitle
            builder
                .setContentText("Paused – ${formatMs(remainingMs)}")
                .setProgress(100, pausedProgressPercent(), false)
                .addAction(
                    android.R.drawable.ic_media_play,
                    "Resume",
                    buildActionIntent(BROADCAST_RESUME, REQ_RESUME),
                )
        } else {
            // Running: use Android's built-in Chronometer for free live updates
            builder
                .setUsesChronometer(true)
                // Count DOWN to endAtMs (API 24+ — no-op on older devices)
                .setChronometerCountDown(true)
                .setWhen(endAtMs)
                .setProgress(100, runningProgressPercent(), false)

            val subtext = buildCleaningSubtext()
            if (subtext.isNotEmpty()) builder.setSubText(subtext)

            builder.addAction(
                android.R.drawable.ic_media_pause,
                "Pause",
                buildActionIntent(BROADCAST_PAUSE, REQ_PAUSE),
            )
        }

        return builder.build()
    }

    /** Returns "Next cleaning: MM:SS" if a cleaning alarm is scheduled. */
    private fun buildCleaningSubtext(): String {
        val ms = nextCleaningAtMs ?: return ""
        val inMs = ms - System.currentTimeMillis()
        return if (inMs > 0) "Next cleaning: ${formatMs(inMs)}" else ""
    }

    /** Progress 0–100 while running, based on current wall-clock time. */
    private fun runningProgressPercent(): Int {
        val elapsed = totalDurationMs - (endAtMs - System.currentTimeMillis())
        return ((elapsed.toDouble() / totalDurationMs) * 100)
            .toInt().coerceIn(0, 100)
    }

    /** Progress 0–100 when paused, based on stored [remainingMs]. */
    private fun pausedProgressPercent(): Int {
        val elapsed = totalDurationMs - remainingMs
        return ((elapsed.toDouble() / totalDurationMs) * 100)
            .toInt().coerceIn(0, 100)
    }

    /** Formats a millisecond duration as H:MM:SS or MM:SS. */
    private fun formatMs(ms: Long): String {
        val totalSeconds = (ms / 1000).coerceAtLeast(0L)
        val h = totalSeconds / 3600
        val m = (totalSeconds % 3600) / 60
        val s = totalSeconds % 60
        return if (h > 0) "%d:%02d:%02d".format(h, m, s)
        else "%02d:%02d".format(m, s)
    }

    /** Creates a broadcast PendingIntent used by notification action buttons. */
    private fun buildActionIntent(broadcastAction: String, requestCode: Int): PendingIntent {
        val intent = Intent(broadcastAction).apply { setPackage(packageName) }
        return PendingIntent.getBroadcast(
            this,
            requestCode,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
    }

    // -------------------------------------------------------------------------
    // Notification channel (API 26+)
    // -------------------------------------------------------------------------
    private fun createNotificationChannel() {
        val channel = NotificationChannel(
            CHANNEL_ID,
            "Timer Status",
            NotificationManager.IMPORTANCE_LOW,
        ).apply {
            description = "Live countdown of the running electrolysis timer"
            setShowBadge(false)
            enableVibration(false)
            enableLights(false)
        }
        getSystemService(NotificationManager::class.java)
            .createNotificationChannel(channel)
    }
}
