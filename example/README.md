```dart

/// Import type of Flutter Widgets Modifiers as needed
import 'package:widgets_modifiers/interaction/touch_interactions_widgets_modifiers.dart';
import 'package:widgets_modifiers/layout/single_child_layout_widgets_modifiers.dart';
import 'package:widgets_modifiers/painting/painting_effect_widgets_modifiers.dart';
import 'package:widgets_modifiers/style/styling_widgets_modifiers.dart';

/// Flutter library that transform common-use widgets into companion modifiers,
/// countering tree-like structure in code.
/// Please refer to https://github.com/CW-Henry/widget_modifiers for
/// documentation about the library.
enum IncludedModifiers {
  
  /// Interactions Modifiers
  absorbPointer,
  gesture,
  ripple,

  /// Layout Modifiers
  frame,
  align,
  center,
  aspectRatio,
  flexible,
  expand,

  /// Painting Modifiers
  ink,
  border,
  shadow,
  transform,
  translate,
  opacity,

  /// Styling Modifiers
  safeArea,
  padding,
  theme,
  material
}


```