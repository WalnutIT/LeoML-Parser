// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013100654
// 13.10.2023 10:06
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/mixins/list_text_widget.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A template for rendering lists in a LeoML document.
///
/// This template represents a list in a LeoML document. It can render both ordered and
/// unordered lists. It takes the parsed LeoML object and displays the list items in a
/// column layout.
///
/// Usage:
///
/// ```dart
/// const leoMLObject = {'li': ['Item 1', 'Item 2', 'Item 3']};
/// return Li(
///   object: leoMLObject,
/// );
/// ```
class Li extends StatelessWidgetTemplate with ListTextWidget {
  /// Creates a List template with the specified [key] and [object].
  ///
  /// The [key] is an optional identifier, and the [object] must contain an 'li'
  /// key with a corresponding List<String> value representing the list items.
  const Li({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: getTextWidgets(
          object,
          li,
        ),
      );

  @override
  void validateObject() {
    for (var value in object[li]) {
      if (value is! String) {
        throw AtomicObjectIsNotStringException(
          subTagName: li,
        );
      }
    }
  }
}
