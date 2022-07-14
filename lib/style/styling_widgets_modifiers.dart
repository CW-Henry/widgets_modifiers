import 'package:flutter/material.dart';

/// Flutter Widgets Modifiers for Styling widgets
/// For more: https://docs.flutter.dev/development/ui/widgets/styling
extension StylingWidgetsModifiers on Widget{
  /// Modifier for setting widget padding, with logic included for different orientations.
  /// Priority to set padding in ascending order are: EdgeInsets.all() ->
  /// EdgeInsets.symmetric() -> EdgeInsets.only() -> EdgeInsets.all(8).
  /// If none parameters are provided, it returns default padding value of 8.0.
  Padding padding(
      {double? left,
        double? right,
        double? top,
        double? bottom,
        double? horizontal,
        double? vertical,
        double? all}) {
    return Padding(
      padding: all != null
          ? EdgeInsets.all(all)
          : horizontal != null || vertical != null
          ? EdgeInsets.symmetric(
          horizontal: horizontal ?? 0, vertical: vertical ?? 0)
          : left != null || right != null || top != null || bottom != null
          ? EdgeInsets.only(
          left: left ?? 0,
          right: right ?? 0,
          top: top ?? 0,
          bottom: bottom ?? 0)
          : const EdgeInsets.all(8),
      child: this,
    );
  }
}