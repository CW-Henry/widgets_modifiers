import 'package:flutter/material.dart';

/// Flutter Widgets Modifiers for Painting and effect widgets
/// For more: https://docs.flutter.dev/development/ui/widgets/painting
extension PaintingEffectWidgetsModifiers on Widget {
  /// Modifier for painting a decoration (which can be a simple color) on a Material.
  Ink ink({
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    double? width,
    double? height
  }) {
    return Ink(
      padding: padding,
      color: color,
      decoration: decoration,
      width: width,
      height: height,
      child: this,
    );
  }
  /// Modifier for drawing borders around widgets.
  DecoratedBox border({
    Color color = const Color(0xFF000000),
    double width = 1.0,
    Border? border,
    BorderStyle style = BorderStyle.solid,
    double? radius,
    DecorationPosition position = DecorationPosition.background,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: border == null ? Border.all(
          color: color,
          width: width,
          style: style,) : border,
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
      position: position,
      child: this,
    );
  }

  /// Modifier for adding a shadow for widgets.
  DecoratedBox shadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    double spreadRadius = 0.0,
    BlurStyle blurStyle = BlurStyle.normal,
    DecorationPosition position = DecorationPosition.background
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: color,
            offset: offset,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            blurStyle: blurStyle)
      ]),
      position: position,
      child: this,
    );
  }

  /// Modifier for transform properties.
  Transform transform({
    required Matrix4 transform,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
    FilterQuality? filterQuality
  }) {
    return Transform(
      transform: transform,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: this,
    );
  }

  /// Modifier for translate ability under Transform Widget.
  Transform translate({
    required Offset offset,
    bool transformHitTests = true,
    FilterQuality? filterQuality
  }) {
    return Transform.translate(
      offset: offset,
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: this,
    );
  }

  /// Modifier for adding opaque widgets.
  Opacity opacity({
    required double opacity,
    bool alwaysIncludeSemantics = false
  }) {
    return Opacity(
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      child: this,
    );
  }
}
