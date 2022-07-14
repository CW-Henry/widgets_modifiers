import 'package:flutter/material.dart';

/// Flutter Widgets Modifiers for Single-child layout widgets
/// For more: https://docs.flutter.dev/development/ui/widgets/layout
extension SingleChildLayoutWidgetsModifiers on Widget {
  /// Modifier for setting widget size.
  Widget frame(
      {double? minWidth,
      double? minHeight,
      double? width,
      double? height,
      double? maxWidth,
      double? maxHeight,
      double? idealWidth,
      double? idealHeight}) {
    return minWidth != null || minHeight != null
        ? ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: minWidth ?? 0.0, minHeight: minHeight ?? 0.0))
        : width != null || height != null
            ? SizedBox(
                width: width,
                height: height,
              )
            : maxWidth != null || maxHeight != null
                ? LimitedBox(
                    maxWidth: maxWidth ?? double.infinity,
                    maxHeight: maxHeight ?? double.infinity,
                    child: this,
                  )
                : idealWidth != null || idealHeight != null
                    ? PreferredSize(
                        preferredSize: Size(idealWidth ?? double.infinity,
                            idealHeight ?? double.infinity),
                        child: this)
                    : const SizedBox.shrink();
  }

  /// Modifier for aligning child widgets in place, e.g. in a large Column or Row.
  Align align({
    AlignmentGeometry alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) {
    return Align(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }

  /// Modifier for centering widgets.
  Center center({
    double? widthFactor,
    double? heightFactor,
  }) {
    return Center(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }

  /// Modifier for providing widget aspect ratio attributes.
  AspectRatio aspectRatio(double aspectRatio) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: this,
    );
  }

  /// Modifier for expanding widgets.
  Expanded expand({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }
}
