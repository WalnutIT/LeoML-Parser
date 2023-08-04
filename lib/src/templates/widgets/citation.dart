// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704091720
// 04.07.2023 09:17
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget that represents a citation.
class Citation extends StatelessWidgetTemplate {
  /// Creates a [Citation] widget.
  ///
  /// The [citationBuilder] parameter specifies the text of the citation.
  const Citation({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Text(
        object['citation'],
        style: smallTextStyle(),
      );

  @override
  void validateObject() {
    if (object['citation'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'citation',
      );
    }
  }
}

