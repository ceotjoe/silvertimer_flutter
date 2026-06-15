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
    return CupertinoNavigationBar(
      middle: Text(title),
      trailing: trailingActions.isEmpty
          ? null
          : Row(mainAxisSize: MainAxisSize.min, children: trailingActions),
    );
  }

  return AppBar(
    title: Text(title),
    actions: trailingActions,
  );
}
