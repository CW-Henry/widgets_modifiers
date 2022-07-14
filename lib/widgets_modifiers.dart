library widgets_modifiers;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Flutter library that transform common-use widgets into companion modifiers,
/// countering tree-like structure in code.
/// Please refer to https://github.com/CW-Henry/widget_modifiers for
/// documentation about the library.
extension WidgetsModifier on Widget {
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

  /// Modifiers for declaring gestures actions.
  GestureDetector gesture(
      {GestureTapDownCallback? onTapDown,
      GestureTapUpCallback? onTapUp,
      GestureTapCallback? onTap,
      GestureTapCancelCallback? onTapCancel,
      GestureTapCallback? onSecondaryTap,
      GestureTapDownCallback? onDoubleTapDown,
      GestureTapCallback? onDoubleTap,
      GestureTapCancelCallback? onDoubleTapCancel,
      GestureLongPressDownCallback? onLongPressDown,
      GestureLongPressCancelCallback? onLongPressCancel,
      GestureLongPressCallback? onLongPress,
      GestureLongPressStartCallback? onLongPressStart,
      GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
      GestureLongPressUpCallback? onLongPressUp,
      GestureLongPressEndCallback? onLongPressEnd,
      HitTestBehavior? behavior,
      bool excludeFromSemantics = false,
      DragStartBehavior dragStartBehavior = DragStartBehavior.start}) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onDoubleTapDown: onDoubleTapDown,
      onDoubleTap: onDoubleTap,
      onDoubleTapCancel: onDoubleTapCancel,
      onLongPressDown: onLongPressDown,
      onLongPressCancel: onLongPressCancel,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,
      child: this,
    );
  }

  /// Modifiers for adding ripple effect on widget, and their gestures actions.
  /// This utilizes Flutter built-in InkWell widget.
  InkWell ripple(
      {GestureTapCallback? onTap,
      GestureTapCallback? onDoubleTap,
      GestureLongPressCallback? onLongPress,
      GestureTapDownCallback? onTapDown,
      GestureTapUpCallback? onTapUp,
      GestureTapCancelCallback? onTapCancel,
      ValueChanged<bool>? onHighlightChanged,
      ValueChanged<bool>? onHover,
      MouseCursor? mouseCursor,
      Color? focusColor,
      Color? hoverColor,
      Color? highlightColor,
      MaterialStateProperty<Color?>? overlayColor,
      Color? splashColor,
      InteractiveInkFeatureFactory? splashFactory,
      double? radius,
      BorderRadius? borderRadius,
      ShapeBorder? customBorder,
      bool? enableFeedback = true,
      bool excludeFromSemantics = false,
      FocusNode? focusNode,
      bool canRequestFocus = true,
      ValueChanged<bool>? onFocusChange,
      bool autofocus = false}) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      mouseCursor: mouseCursor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      overlayColor: overlayColor,
      splashColor: splashColor,
      splashFactory: splashFactory,
      radius: radius,
      borderRadius: borderRadius,
      customBorder: customBorder,
      enableFeedback: enableFeedback,
      excludeFromSemantics: excludeFromSemantics,
      focusNode: focusNode,
      canRequestFocus: canRequestFocus,
      onFocusChange: onFocusChange,
      autofocus: autofocus,
      child: this,
    );
  }

  /// Modifier for drawing borders around widgets.
  DecoratedBox border({
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    double? radius,
    DecorationPosition position = DecorationPosition.background,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: width,
          style: style,
        ),
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
    DecorationPosition position = DecorationPosition.background,
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

  /// Modifier for transform properties.
  Transform transform({
    required Matrix4 transform,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
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

  /// Modifier for adding opaque widgets.
  Opacity opacity({
    required double opacity,
    bool alwaysIncludeSemantics = false,
  }) {
    return Opacity(
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      child: this,
    );
  }
}
