// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230707070215
// 07.07.2023 07:02
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/templates/article/widgets/catch_line.dart';
import 'package:leoml_parser/src/templates/article/widgets/section_headline.dart';
import 'package:leoml_parser/src/templates/blog/widgets/opening.dart';
import 'package:leoml_parser/src/templates/default_widgets_creator.dart';
import 'package:leoml_parser/src/templates/widgets/citation.dart';
import 'package:leoml_parser/src/templates/widgets/headline.dart';
import 'package:leoml_parser/src/templates/widgets/image.dart';
import 'package:leoml_parser/src/templates/widgets/list.dart';
import 'package:leoml_parser/src/templates/widgets/section.dart';
import 'package:leoml_parser/src/templates/widgets/sub_headline.dart';

void main() {
  group('positive tests', () {
    test('Headline widget is returned', () {
      // given

      // when
      final result = HeadlineWidget().create(
        object: {"headline": "<your headline>"},
      );
      // then
      expect(result is Headline, isTrue);
    });
    test('SubHeadline widget is returned', () {
      // given

      // when
      final result = SubHeadlineWidget().create(
        object: {"subHeadline": "<your sub headline>"},
      );
      // then
      expect(result is SubHeadline, isTrue);
    });
    test('SectionHeadline widget is returned', () {
      // given

      // when
      final result = SectionHeadlineWidget().create(
        object: {"sectionHeadline": "<your sub headline>"},
      );
      // then
      expect(result is SectionHeadline, isTrue);
    });
    test('Section widget is returned', () {
      // given

      // when
      final result = SectionWidget().create(
        object: {"section": "<your section content>"},
      );
      // then
      expect(result is Section, isTrue);
    });
    test('Citation widget is returned', () {
      // given

      // when
      final result = CitationWidget().create(
        object: {
          "citation": "<citation>",
        },
      );
      // then
      expect(result is Citation, isTrue);
    });
    test('LeoImage widget is returned', () {
      // given

      // when
      final result = ImageWidget().create(
        object: {
          "image": {
            "imageURL": "<your image url>",
            "imageDescription": "<your image description>",
          },
        },
      );
      // then
      expect(result is LeoImage, isTrue);
    });
    test('List widget is returned', () {
      // given

      // when
      final result = ListWidget().create(
        object: {
          "list": [
            "<element 1>",
            "<element 2>",
            "...",
            "<element n>",
          ],
        },
      );
      // then
      expect(result is BulletList, isTrue);
    });
    test('CatchLine widget is returned', () {
      // given

      // when
      final result = CatchLineWidget().create(
        object: {"catchLine": "<your catch line>"},
      );
      // then
      expect(result is CatchLine, isTrue);
    });
    test('Opening widget is returned', () {
      // given

      // when
      final result = OpeningWidget().create(
        object: {
          "opening": {
            "text": "<your text>",
            " image_url": "<your image url>",
          },
        },
      );
      // then
      expect(result is Opening, isTrue);
    });
  });
}
