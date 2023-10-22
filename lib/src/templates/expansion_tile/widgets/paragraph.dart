// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231019072150
// 19.10.2023 07:21
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget that represents a paragraph headline.
class Paragraph extends StatelessWidgetTemplate {
  /// Creates a [Paragraph] widget.
  ///
  /// The [Paragraph] parameter specifies the text of the
  /// paragraph text.
  const Paragraph({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Text(
        object[paragraph],
        style: smallTextStyle(),
      );

  @override
  void validateObject() {
    if (object[paragraph] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: paragraph,
      );
    }
  }
}
