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

Simple implementation: 
```dart
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: Wrap(
            children: [
                Text("Text with Padding").padding(bottom: 16),
                ColoredBox(color: Colors.green).frame(width: 100, height: 160) // Same as SizedBox usage
            ]
        )
     );
  }
```
Widget modifiers parameters are mostly similar to their original flutter widget counterpart, with the following exceptions:
  // Interactions Widgets
  - GestureDetector is renamed '.gesture'
  - InkWell is renamed '.ripple'

  // Layout Widgets
  - ConstrainedBox, SizedBox, LimitedBox, PreferredSize are condensed into '.frame', with different parameters

    i. ConstrainedBox
    ```dart
      ListView.builder(
        shrinkWrap: true, 
        ...
        ).frame(minWidth: 145, minHeight: 80), // if minWidth / minHeight is not provided, default to 0.0
    ```

    ii. SizedBox
    ```dart
      Column(...).frame(height: 250); // default width /height null
    ```

    iii. LimitedBox
    ```dart
      var hugeCount = 300

      @override
      Widget build(BuildContext context) {
        ...
        GridView(
          itemCount: hugeCount,
          itemBuilder: (_, index) {
            return GridTile(
              child: Image.network(
                'https://picsum.photos/250?image=9', 
                width: 400, 
                height: 250,
              );
            ) // GridTile
          }
        ).frame(maxHeight: 650 ,̶ ̶m̶a̶x̶W̶i̶d̶t̶h̶:̶ ̶d̶o̶u̶b̶l̶e̶.̶i̶n̶f̶i̶n̶i̶t̶y̶) // GridView 
        // maxHeight / maxWidth defaults to double.infinity, so the latter is not needed
        ...
      }
    ```

    iv. PreferredSize
    ```dart
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(...)
              .frame(idealWidth: 80.0,idealHeight: 80.0)
              // idealWidth / idealHeight default to double.infinity
        );
      }
    ```

    !! If two unrelated properties are used in .frame, it may produce unexpected errors. As default, .frame uses priority approach to decide which proporties to use. 
    
    Priority: minSize > Size > maxSize > preferredSize.


## Additional information
Please refer to Example page for all provided modifiers.
Latest stable versions as in changelogs are recommended.
If you are interested in contributing or any bugs are found, please create a post on the widgets_modifiers library repo Wiki page.  
