// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013132152
// 13.10.2023 13:21
import 'package:flutter/material.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';

/// A mixin that provides a method for converting a list of text strings into a list of
/// formatted Text widgets with bullet points.
///
/// The `getTextWidgets` method takes a map and a key as parameters, retrieves a list
/// of text strings from the map using the provided key, and converts each string into
/// a Text widget with a bullet point. The resulting list of Text widgets is returned.
///
/// Example usage:
///
/// ```dart
/// class MyWidget with ListTextWidget {
///   Map<String, dynamic> data = {
///     'items': ['Item 1', 'Item 2', 'Item 3'],
///   };
///
///   List<Widget> buildItemList() {
///     return getTextWidgets(data, 'items');
///   }
/// }
///
/// void main() {
///   final myWidget = MyWidget();
///   final itemList = myWidget.buildItemList();
///   print(itemList); // List of formatted Text widgets.
/// }
/// ```
mixin ListTextWidget {
  /// Converts a list of text strings into a list of formatted Text widgets with bullet points.
  ///
  /// The [object] parameter is a map containing the list of text strings, and the [key]
  /// parameter is used to access the list from the map. Each text string is formatted with
  /// a bullet point and padding.
  ///
  /// Returns a list of formatted Text widgets.
  List<Widget> getTextWidgets(Map<String, dynamic> object, String key) {
    final output = <Widget>[];

    final list = object[key];

    for (String text in list) {
      final widget = Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          top: 3.0,
        ),
        child: Text(
          '\u2022 $text',
          style: bodyTextStyle(),
        ),
      );

      output.add(widget);
    }

    return output;
  }
}
