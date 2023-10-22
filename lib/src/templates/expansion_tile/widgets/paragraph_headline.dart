// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231018204000
// 18.10.2023 20:40
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget that represents a paragraph headline.
class ParagraphHeadline extends StatelessWidgetTemplate {
  /// Creates a [ParagraphHeadline] widget.
  ///
  /// The [paragraphHeadlineBuilder] parameter specifies the text of the
  /// paragraph headline.
  const ParagraphHeadline({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Text(
    object[paragraphHeadline],
    style: h5TextStyle(),
  );

  @override
  void validateObject() {
    if (object[paragraphHeadline] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: paragraphHeadline,
      );
    }
  }
}
