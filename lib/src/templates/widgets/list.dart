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
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget that displays a bullet list of strings.
class BulletList extends StatelessWidgetTemplate {
  /// Creates a `BulletList` widget.
  ///
  /// The [listBuilder] parameter represents the list of strings to be displayed as bullet points.
  const BulletList({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _getTextWidgets(),
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

  /// Converts the list of strings into a list of text widgets with bullet points.
  List<Widget> _getTextWidgets() {
    final output = <Widget>[];

    final list = object['list'];

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
