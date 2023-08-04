// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704085635
// 04.07.2023 08:56
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget representing a sub headline.
class SubHeadline extends StatelessWidgetTemplate {
  /// Creates a `SubHeadline` widget.
  ///
  /// The [subHeadlineBuilder] parameter is the text content of the sub headline.
  const SubHeadline({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      object['subHeadline'],
      style: h3TextStyle(),
    );
  }

  @override
  void validateObject() {
    if (object['subHeadline'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'subHeadline',
      );
    }
  }
}

