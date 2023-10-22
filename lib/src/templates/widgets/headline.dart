// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704085106
// 04.07.2023 08:51
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget that represents a headline.
class Headline extends StatelessWidgetTemplate {
  /// Creates a [Headline] widget.
  ///
  /// The [headlineBuilder] parameter specifies the text of the headline.
  const Headline({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Text(
        object[headline],
        style: h2TextStyle(),
      );

  @override
  void validateObject() {
    if (object[headline] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: headline,
      );
    }
  }
}
