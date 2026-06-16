// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silvertimer_flutter/core/utils/platform_utils.dart';

/// Returns a [CupertinoNavigationBar] on iOS/macOS and a Material [AppBar]
/// on all other platforms. Both implement [PreferredSizeWidget] so the result
/// can be passed directly to [Scaffold.appBar].
///
/// [trailingActions] are placed in the trailing slot on Cupertino and in
/// [AppBar.actions] on Material.
PreferredSizeWidget adaptiveAppBar({
  required String title,
  List<Widget> trailingActions = const [],
}) {
  if (isApplePlatform) {
    return _CupertinoAdaptiveNavigationBar(
      title: title,
      trailingActions: trailingActions,
    );
  }

  return AppBar(
    title: Text(title),
    actions: trailingActions,
  );
}

/// [CupertinoNavigationBar] with colours derived from the surrounding
/// [Theme], so it respects dark mode instead of using hardcoded light values.
class _CupertinoAdaptiveNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CupertinoAdaptiveNavigationBar({
    required this.title,
    required this.trailingActions,
  });

  final String title;
  final List<Widget> trailingActions;

  @override
  Size get preferredSize =>
      const Size.fromHeight(kMinInteractiveDimensionCupertino);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return CupertinoNavigationBar(
      backgroundColor: colorScheme.surface,
      // CupertinoNavigationBar draws its own border; remove it so the
      // bar blends with the rest of the surface without a hard line.
      border: null,
      middle: Text(
        title,
        style: TextStyle(color: colorScheme.onSurface),
      ),
      trailing: trailingActions.isEmpty
          ? null
          : IconTheme(
              data: IconThemeData(color: colorScheme.onSurface),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: trailingActions,
              ),
            ),
    );
  }
}
