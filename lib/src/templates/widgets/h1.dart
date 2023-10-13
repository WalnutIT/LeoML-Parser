// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013095913
// 13.10.2023 09:59
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A custom widget for rendering Level 1 headers (H1) in LeoML content.
///
/// The `H1` class extends [StatelessWidgetTemplate] and is designed to render
/// Level 1 headers (H1) based on the provided LeoML object. It ensures that
/// the object associated with the H1 tag is a string and applies the appropriate
/// text style to the rendered header.
///
/// Usage:
///
/// ```dart
/// H1(object: leoMLObject)
/// ```
class H1 extends StatelessWidgetTemplate {
  /// Creates an `H1` widget instance.
  ///
  /// The `object` parameter is a required LeoML object containing the content
  /// to be displayed as a Level 1 header (H1).
  const H1({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Text(
        object[h1],
        style: h1TextStyle(),
      );

  @override
  void validateObject() {
    // Validate that the object associated with the H1 tag is a string.
    if (object[h1] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: h1,
      );
    }
  }
}
