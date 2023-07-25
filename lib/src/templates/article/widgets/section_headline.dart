// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704091938
// 04.07.2023 09:19
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget that displays the headline of a section.
class SectionHeadline extends StatelessWidgetTemplate {
  /// Creates a [SectionHeadline] widget.
  ///
  /// The [sectionHeadline] parameter specifies the text to be displayed as the section headline.
  const SectionHeadline({
    required super.object,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        object['sectionHeadline'],
        style: h4TextStyle(),
      );

  @override
  void validateObject() {
    if (object['sectionHeadline'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'sectionHeadline',
      );
    }
  }
}

