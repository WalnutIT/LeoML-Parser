// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704085813
// 04.07.2023 08:58
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget representing a section of text.
class Section extends StatelessWidgetTemplate {
  /// Creates a `Section` widget.
  ///
  /// The [sectionBuilder] parameter is the text content of the section.
  const Section({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      object['section'],
      style: bodyTextStyle(),
    );
  }

  @override
  void validateObject() {
    if (object['section'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'section',
      );
    }
  }
}
