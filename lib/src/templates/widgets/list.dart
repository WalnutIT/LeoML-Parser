// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704091122
// 04.07.2023 09:11
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/mixins/list_text_widget.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget that displays a bullet list of strings.
///
/// The `BulletList` widget is used to render a list of strings as bullet points
/// in a LeoML document. It takes a `listBuilder` parameter, which represents the
/// list of strings to be displayed as bullet points.
///
/// Usage:
///
/// ```dart
/// const leoMLObject = {'list': ['Item 1', 'Item 2', 'Item 3']};
/// return BulletList(
///   object: leoMLObject,
/// );
/// ```
class BulletList extends StatelessWidgetTemplate with ListTextWidget {
  /// Creates a `BulletList` widget.
  ///
  /// The [key] is an optional identifier, and the [object] must contain a 'list'
  /// key with a corresponding List<String> value representing the list items.
  const BulletList({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: getTextWidgets(
          object,
          'list',
        ),
      );

  @override
  void validateObject() {
    for (var value in object['list']) {
      if (value is! String) {
        throw AtomicObjectIsNotStringException(
          subTagName: 'list',
        );
      }
    }
  }
}
