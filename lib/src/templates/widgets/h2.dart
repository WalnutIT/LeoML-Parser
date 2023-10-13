// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013095920
// 13.10.2023 09:59
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// The `H2` class is a Flutter widget that represents a level 2 heading in the LeoML document.
///
/// It extends the `StatelessWidgetTemplate` class and is responsible for rendering text with the
/// style defined by `h2TextStyle()`. The content for this heading is provided through the `object`
/// property, which is expected to be a [String].
///
/// Example:
/// ```dart
/// H2(object: 'This is a level 2 heading'),
/// ```
///
/// If the provided `object` is not a [String], an [AtomicObjectIsNotStringException] is thrown
/// during object validation.
class H2 extends StatelessWidgetTemplate {
  /// Creates an `H2` widget.
  ///
  /// The `object` parameter is required and should contain the text content for the heading.
  const H2({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Text(
        object[h2],
        style: h2TextStyle(),
      );

  @override
  void validateObject() {
    if (object[h2] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: h2,
      );
    }
  }
}
