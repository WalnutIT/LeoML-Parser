// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231019091732
// 19.10.2023 09:17
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/expansion_tile/widgets/paragraph.dart';
import 'package:leoml_parser/src/templates/expansion_tile/widgets/paragraph_headline.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';
import 'package:leoml_parser/src/templates/widgets/citation.dart';
import 'package:leoml_parser/src/templates/widgets/headline.dart';
import 'package:leoml_parser/src/templates/widgets/image.dart';
import 'package:leoml_parser/src/templates/widgets/list.dart';
import 'package:leoml_parser/src/templates/widgets/section.dart';
import 'package:leoml_parser/src/templates/widgets/section_headline.dart';
import 'package:leoml_parser/src/templates/widgets/sub_headline.dart';

/// A widget that represents a header.
class Content extends StatelessWidgetTemplate {
  /// Creates a [Content] widget.
  ///
  /// The [Content] parameter specifies the text of the
  /// header.
  const Content({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) {
    final widgetList = <Widget>[];

    for (Map<String, dynamic> map in object[content] as List) {
      Widget widget = const Placeholder();

      switch (map.keys.first) {
        case section:
          widget = Section(object: map);
          break;
        case sectionHeadline:
          widget = SectionHeadline(object: map);
          break;
        case paragraphHeadline:
          widget = ParagraphHeadline(object: map);
          break;
        case paragraph:
          widget = Paragraph(object: map);
          break;
        case image:
          widget = LeoImage(object: map);
          break;
        case citation:
          widget = Citation(object: map);
          break;
        case list:
          widget = BulletList(object: map);
          break;
        default:
          widget = const Placeholder();
      }

      widgetList.add(Padding(
        padding: const EdgeInsets.all(12.0),
        child: widget,
      ),);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetList,
    );
  }

  @override
  void validateObject() {
    // if (object[content][section] is! String) {
    //   throw AtomicObjectIsNotStringException(
    //     subTagName: '$content --> $section',
    //   );
    // }

    // if ((object[header] is Map) &&
    //     (object[header] as Map).containsKey(subHeadline) &&
    //     object[header][headline] is! String) {
    //   throw AtomicObjectIsNotStringException(
    //     subTagName: '$header --> $subHeadline',
    //   );
    // }
  }
}
