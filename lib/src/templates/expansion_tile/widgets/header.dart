// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231019090837
// 19.10.2023 09:08
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';
import 'package:leoml_parser/src/templates/widgets/headline.dart';
import 'package:leoml_parser/src/templates/widgets/sub_headline.dart';

/// A widget that represents a header.
class Header extends StatelessWidgetTemplate {
  /// Creates a [Header] widget.
  ///
  /// The [Header] parameter specifies the text of the
  /// header.
  const Header({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headline(object: object[header]),
          if ((object[header] as Map).containsKey(subHeadline))
            SubHeadline(object: object[header]),
        ],
      );

  @override
  void validateObject() {
    if (object[header][headline] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: '$header --> $headline',
      );
    }

    if ((object[header] is Map) &&
        (object[header] as Map).containsKey(subHeadline) &&
        object[header][headline] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: '$header --> $subHeadline',
      );
    }
  }
}
