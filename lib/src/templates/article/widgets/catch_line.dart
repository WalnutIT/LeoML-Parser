// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704092004
// 04.07.2023 09:20
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget that displays the catch line of an article.
class CatchLine extends StatelessWidgetTemplate {
  /// Creates a [CatchLine] widget.
  ///
  /// The [catchLineBuilder] parameter specifies the text to be displayed as the catch line.
  const CatchLine({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Text(
        object['catchLine'],
        style: h1TextStyle(),
      );

  @override
  void validateObject() {
    if (object['catchLine'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'catchLine',
      );
    }
  }
}
