import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:silvertimer_flutter/core/extensions/duration_extensions.dart';
import 'package:silvertimer_flutter/core/extensions/l10n_extension.dart';
import 'package:silvertimer_flutter/features/history/domain/models/session_record.dart';
import 'package:silvertimer_flutter/features/history/presentation/history_controller.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(historyControllerProvider);
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.historyTitle),
        actions: [
          historyAsync.whenOrNull(
            data: (sessions) => sessions.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.delete_sweep_outlined),
                    onPressed: () => _confirmClearAll(context, ref),
                    tooltip: l10n.clearAll,
                  ),
          ) ??
              const SizedBox.shrink(),
        ],
      ),
      body: historyAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48),
              const SizedBox(height: 16),
              Text(l10n.historyLoadError(e.toString())),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => ref.invalidate(historyControllerProvider),
                child: Text(l10n.retryButton),
              ),
            ],
          ),
        ),
        data: (sessions) => sessions.isEmpty
            ? _EmptyState()
            : ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, i) => _SessionTile(
                  record: sessions[i],
                  onDelete: () => ref
                      .read(historyControllerProvider.notifier)
                      .deleteSession(sessions[i].id),
                ),
              ),
      ),
    );
  }

  void _confirmClearAll(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.clearAllHistoryTitle),
        content: Text(l10n.clearAllHistoryBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancelButton),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: Theme.of(ctx).colorScheme.error),
            child: Text(l10n.clearAllButton),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true) {
        ref.read(historyControllerProvider.notifier).clearAll();
      }
    });
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({required this.record, required this.onDelete});

  final SessionRecord record;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMM d, yyyy').format(record.completedAt);
    final timeStr = DateFormat('HH:mm').format(record.completedAt);
    final duration = Duration(seconds: record.durationSeconds);

    final volumeText = record.volumeLiters >= 1.0
        ? '${record.volumeLiters.toStringAsFixed(2)} L'
        : '${(record.volumeLiters * 1000).toStringAsFixed(0)} mL';

    return Dismissible(
      key: ValueKey(record.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Theme.of(context).colorScheme.errorContainer,
        child: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
      ),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            record.completed ? Icons.check : Icons.timer_off,
            size: 20,
          ),
        ),
        title: Text('$volumeText  •  ${record.targetPpm} PPM'),
        subtitle: Text('${record.currentMilliamps} mA  •  ${duration.toReadable()}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(dateStr, style: Theme.of(context).textTheme.bodySmall),
            Text(timeStr, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.history, size: 80, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 16),
          Text(
            l10n.noSessionsYet,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.noSessionsSubtitle,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
