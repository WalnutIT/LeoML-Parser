// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704152328
// 04.07.2023 15:23
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/article/widgets/catch_line.dart';
import 'package:leoml_parser/src/templates/article/widgets/section_headline.dart';
import 'package:leoml_parser/src/templates/blog/widgets/opening.dart';
import 'package:leoml_parser/src/templates/widgets/citation.dart';
import 'package:leoml_parser/src/templates/widgets/headline.dart';
import 'package:leoml_parser/src/templates/widgets/image.dart';
import 'package:leoml_parser/src/templates/widgets/list.dart';
import 'package:leoml_parser/src/templates/widgets/section.dart';
import 'package:leoml_parser/src/templates/widgets/sub_headline.dart';

abstract class WidgetFactory {
  Widget getWidget({required String key, required Map object});
}

class LeoMLParserWidgetFactory extends WidgetFactory {

  // TODO(daniel): rework and make it OOP
  @override
  // ignore: long-method
  Widget getWidget({required String key, required Map object}) {
    switch (key) {
      case 'headline':
        return Headline(
          headline: object['headline'],
        );
      case 'subHeadline':
        return SubHeadline(
          subHeadline: object['subHeadline'],
        );

      case 'sectionHeadline':
        return SectionHeadline(
          sectionHeadline: object['sectionHeadline'],
        );
      case 'section':
        return Section(
          section: object['section'],
        );
      case 'opening':
        return Opening(
          text: object['opening']['text'],
          imageUrl: object['opening'].containsKey('imageUrl') ? object['opening']['imageUrl'] : null,
        );
      case 'catchLine':
        return CatchLine(
          catchLine: object['catchLine'],
        );
      case 'image':
        return LeoImage(
          imageUrl: object['image']['imageUrl'],
          imageDescription: object['image'].containsKey('imageDescription')
              ? object['image']['imageDescription']
              : null,
        );
      case 'citation':
        return Citation(
          citation: object['citation'],
        );

      case 'list':
        return BulletList(
          list: object['list'],
        );
      default:
        return Section(
          section: object[object.keys.first],
        );
    }
  }
}
