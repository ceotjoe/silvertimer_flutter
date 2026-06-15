// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silvertimer_flutter/core/theme/app_cupertino_colors.dart';
import 'package:silvertimer_flutter/core/utils/platform_utils.dart';

/// A text field that uses Cupertino-style decoration (filled, no outline) on
/// iOS/macOS, and the standard Material [TextFormField] decoration elsewhere.
/// Stays inside a [Form] so validation keeps working on all platforms.
class AdaptiveTextFormField extends StatelessWidget {
  const AdaptiveTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.inputFormatters,
    this.decoration,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.textAlign = TextAlign.start,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  /// Material decoration — [hintText], [suffixText] etc. are extracted and
  /// applied to the Cupertino variant automatically.
  final InputDecoration? decoration;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    if (isApplePlatform) {
      final fillColor = AppCupertinoColors.inputFill.resolveFrom(context);

      return TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        validator: validator,
        textAlign: textAlign,
        decoration: InputDecoration(
          hintText: decoration?.hintText,
          suffixText: decoration?.suffixText,
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
            ),
          ),
          isDense: decoration?.isDense,
        ),
      );
    }

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: decoration,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      textAlign: textAlign,
    );
  }
}

/// Plain (non-form) adaptive text field for settings inputs.
class AdaptiveTextField extends StatelessWidget {
  const AdaptiveTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.inputFormatters,
    this.decoration,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    if (isApplePlatform) {
      final fillColor = AppCupertinoColors.inputFill.resolveFrom(context);

      return TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: decoration?.hintText,
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
            ),
          ),
          isDense: decoration?.isDense,
        ),
      );
    }

    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: decoration,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
