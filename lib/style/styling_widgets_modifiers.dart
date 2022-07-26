import 'package:flutter/material.dart';

/// Flutter Widgets Modifiers for Styling widgets
/// For more: https://docs.flutter.dev/development/ui/widgets/styling
extension StylingWidgetsModifiers on Widget {
  /// Modifier for Safearea inclusion.
  SafeArea safeArea({
    Key? key,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
    required this.child,
  }){
    return SafeArea(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
      child: this,
    );
  }


  /// Modifier for setting widget padding, with logic included for different orientations.
  /// Priority to set padding in ascending order are: EdgeInsets.all() ->
  /// EdgeInsets.symmetric() -> EdgeInsets.only() -> EdgeInsets.all(8).
  /// If none parameters are provided, it returns default padding value of 8.0.
  Padding padding({
      Key? key,
      double? left,
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

  /// Modifier for setting widgets Theme Data.
  Theme theme({
    Key? key,
    required this.data,
    required this.child,
  }) {
    return Theme({
      data: data,
      child: this,
    });
  }

  /// Modifier for creating a piece of material for widgets.
  Material material({
    Key? key,
    this.type = MaterialType.canvas,
    this.elevation = 0.0,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.textStyle,
    this.borderRadius,
    this.shape,
    this.borderOnForeground = true,
    this.clipBehavior = Clip.none,
    this.animationDuration = kThemeChangeDuration,
    this.child,
  }) {
    return Material({
      type: type,
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      textStyle: textStyle,
      borderRadius: borderRadius,
      shape: shape,
      borderOnForeground: borderOnForeground,
      clipBehavior: clipBehavior,
      animationDuration: animationDuration,
      child: this,
    });
  }
}
