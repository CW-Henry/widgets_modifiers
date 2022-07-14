import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Flutter Widgets Modifiers for Interaction model widgets
/// For more: https://docs.flutter.dev/development/ui/widgets/interaction
extension TouchInteractionsWidgetsModifiers on Widget {
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
}
