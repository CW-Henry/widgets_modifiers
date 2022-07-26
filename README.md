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

## Quickstart

```dart
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: Wrap(
            children: [
                // Format for widget modifiers, below is equal to Padding(padding: EdgeInsets.only(bottom: 16),child: Text('with padding'))
                Text('with padding').padding(bottom: 16),

                // You can also chain multiple widget modifiers, in the order when child widget are wrapped by its parent
                FlutterLogo().frame(width: 650, height: 300) // Same as SizedBox usage
                          .aspectRatio(16/9) 
                          .border(color: Colors.yellow, width: 2.0)
                          .ripple(onTap: (){
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('You clicked!'),
                                content: const Text('I am Flutter Logo'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Yes'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            )
                          })
                          .center()
                          .expand()
                          ...
                // The chaining of widget modifiers does not have a limit.
            ]
        )
     );
  }
```

# Detailed Usage

Widget modifiers parameters are mostly similar to their original flutter widget counterpart, with the following exceptions -

## a. Interaction widgets

  - GestureDetector is renamed .gesture()
  - InkWell is renamed .ripple()

## b. Layout widgets

  - Flutter widgets (ConstrainedBox, SizedBox, LimitedBox, PreferredSize) are condensed into .frame(), as different modifiable parameters

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

    !! If two unrelated properties are used in .frame(), it may produce unexpected errors. As default, .frame() uses priority approach to decide which proporties to use. 
    
    Priority: minSize > Size > maxSize > preferredSize.

## c. Painting widgets
  
  - Border as in .border() will draw all four sides width by default (1.0, changeable by    user) around the enforced widget, however if the user wants a more customized border it can be done by providing a border parameter(default to null) for .border().

    For instance:
    ```dart
      ColoredBox(color: Color(0xFFBFBFBF))
        .border(border: Border(
            top: BorderSide(width: 3.0, color: Color(0xFFDFDFDF)),
            left: BorderSide(width: 4.0, color: Color(0xFFDFDFDF)),
            right: BorderSide(width: 2.0, color: Color(0xFF7F7F7F)),
            bottom: BorderSide(width: 1.0, color: Color(0xFF7F7F7F)),
          )
        ) // HERE
    ```
    * Do note that if a border parameter is provided for .border(), it will override any given value in width parameter.

  - .shadow() is constructed with BoxShadow in BoxDecoration

## d. Styling widgets

  - .padding() utilizes flutter EdgeInsets class constructors to calculate widgets padding preferences.

    Supported Constructors: 

      i. EdgeInsets.all(double value)
      ```dart
        Stack(...).padding(all: 16)
      ```

      ii. EdgeInsets.symmetric({double vertical = 0.0, double horizontal = 0.0})
      ```dart
        Stack(...).padding(vertical: 8, horizontal: 12)
      ```

      iii. EdgeInsets.only({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0})
      ```dart
        Stack(...).padding(left: 8, top: 6, right: 10, bottom: 13)
      ```

    * if none parameters value are provided, associating widgets with .padding() modifier will return default padding of 8 in all directions.

    * For EdgeInsets class information, please refer to Flutter documentation https://api.flutter.dev/flutter/painting/EdgeInsets-class.html

# Suggestions and more features

Feel free to provide your suggestions if you found any missing features that you would like widgets_modifiers to add.
If you are interested in contributing or any bugs are found, please create a post on the widgets_modifiers library repo Wiki page.  

## Additional information

Please refer to Example page for collection of all currently provided modifiers.
If you are using the package in your Flutter project, please check and use the latest stable versions as in changelogs.

