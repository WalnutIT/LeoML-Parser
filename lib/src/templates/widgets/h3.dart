// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013095926
// 13.10.2023 09:59
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A template for rendering H3 text in a LeoML document.
///
/// This template represents H3 (Header 3) text in a LeoML document. It takes
/// the parsed LeoML object and displays the text using a predefined H3 text style.
///
/// Usage:
///
/// ```dart
/// const leoMLObject = {'h3': 'This is an H3 heading'};
/// return H3(
///   object: leoMLObject,
/// );
/// ```
class H3 extends StatelessWidgetTemplate {
  /// Creates an H3 template with the specified [key] and [object].
  ///
  /// The [key] is an optional identifier, and the [object] must contain an 'h3'
  /// key with a corresponding String value representing the H3 text content.
  const H3({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Text(
        object[h3],
        style: h3TextStyle(),
      );

  @override
  void validateObject() {
    if (object[h3] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: h3,
      );
    }
  }
}
