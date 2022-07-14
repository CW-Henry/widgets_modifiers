<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to wri
[writing package pages](https://dart.dev/guides/libraries/writing-package-pagte a good package README, see the guide fores).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Flutter library that transform common-use widgets into companion modifiers, collapsing Flutter tree-like code structure.

## Features

Ready-to-use flutter UI modifiers.

## Getting started

If you desire to flatten widget build tree nesting widgets, or to optimize current Flutter code.

## Usage

```dart
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: Wrap(
            children: [
                Text("Padding master").padding(bottom: 16),
                ColoredBox(color: Colors.green).frame(width: 100, height: 160)
            ]
        )
     );
  }
```

## Additional information
Please use latest stable versions as in changelogs.
If you are interested in contributing or any bugs are found, please create a post on the widgets_modifiers library repo Wiki page.  
