// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230723195522
// 23.07.2023 19:55
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/article_does_not_contains_section_exception.dart';
import 'package:leoml_parser/src/exception/article_first_object_is_not_headline_exception.dart';
import 'package:leoml_parser/src/exception/article_second_object_is_not_sub_headline_exception.dart';
import 'package:leoml_parser/src/leo_ml_document_parser.dart';
import 'package:leoml_parser/src/templates/article/article.dart';

import '../../../custom_widgets.dart';
import '../../../test_documents/article/article_ai.dart';
import '../../../test_documents/article/article_catch_line.dart';
import '../../../test_documents/article/article_contains_no_section_json.dart';
import '../../../test_documents/article/article_first_object_is_not_headline_json.dart';
import '../../../test_documents/article/article_image.dart';
import '../../../test_documents/article/article_list.dart';
import '../../../test_documents/article/article_second_object_is_not_sub_headline_json.dart';
import '../blog/blog_test.dart';

void main() {
  group('positive test', () {
    test("has custom widget 'headline'", () {
      // given
      const key = 'headline';

      // when
      final blog = Article(headlineBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'subHeadline'", () {
      // given
      const key = 'subHeadline';

      // when
      final blog = Article(subHeadlineBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'sectionHeadline'", () {
      // given
      const key = 'sectionHeadline';

      // when
      final blog = Article(sectionHeadlineBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'section'", () {
      // given
      const key = 'section';

      // when
      final blog = Article(sectionBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'catchLine'", () {
      // given
      const key = 'catchLine';

      // when
      final blog = Article(catchLineBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'list'", () {
      // given
      const key = 'list';

      // when
      final blog = Article(listBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'image'", () {
      // given
      const key = 'image';

      // when
      final blog = Article(imageBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'citation'", () {
      // given
      const key = 'citation';

      // when
      final blog = Article(citationBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test('is returning the headline widget', () {
      // given
      const key = 'headline';
      final listOfObjects = jsonDecode(articleAI) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final article = Article(headlineBuilder: MyCustomHeadlineBuilder());
      final actual = article.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomHeadline, isTrue);
    });
    test('is returning the subheadline widget', () {
      // given
      const key = 'subHeadline';
      final listOfObjects = jsonDecode(articleAI) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final article = Article(subHeadlineBuilder: MyCustomSubHeadlineBuilder());
      final actual = article.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomSubHeadline, isTrue);
    });
    test('is returning the section widget', () {
      // given
      const key = 'section';
      final listOfObjects = jsonDecode(articleAI) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final article = Article(sectionBuilder: MyCustomSectionBuilder());
      final actual = article.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomSection, isTrue);
    });
    test('is returning the section headline widget', () {
      // given
      const key = 'sectionHeadline';
      final listOfObjects = jsonDecode(articleAI) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final article =
          Article(sectionHeadlineBuilder: MyCustomSectionHeadlineBuilder());
      final actual = article.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomSectionHeadline, isTrue);
    });
    test('is returning the citation widget', () {
      // given
      const key = 'citation';
      final listOfObjects = jsonDecode(articleAI) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final article = Article(citationBuilder: MyCustomCitationBuilder());
      final actual = article.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomCitation, isTrue);
    });
    test('is returning the list widget', () {
      // given
      const key = 'list';
      final listOfObjects = jsonDecode(articleList) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final article = Article(listBuilder: MyCustomListBuilder());
      final actual = article.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomList, isTrue);
    });
    test('is returning the image widget', () {
      // given
      const key = 'image';
      final listOfObjects = jsonDecode(articleImage) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final article = Article(imageBuilder: MyCustomImageWidget());
      final actual = article.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomImage, isTrue);
    });
    test('is returning the catch line widget', () {
      // given
      const key = 'catchLine';
      final listOfObjects = jsonDecode(articleCatchLine) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final article = Article(catchLineBuilder: MyCustomCatchLineBuilder());
      final actual = article.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomCatchLine, isTrue);
    });
    test('assertion returns true', () {
      // given
      final listOfObjects = jsonDecode(articleCatchLine) as List;
      listOfObjects.removeAt(0);

      // when
      final article = Article(catchLineBuilder: MyCustomCatchLineBuilder());
      final actual = article.assertLeoMLStructure(listOfObjects);

      // then
      expect(actual, isTrue);
    });
  });
  group('negative test', () {
    test('first object is not a headline exception is thrown', () {
      // given
      const leoMLDocument = articleFirstObjectIsNotHeadlineJSON;
      const expectedMessage =
          'The first object in your article template is not the "headline" object.\n\n'
          'It is mandatory, that the first object of each article template is the "headline" object.';
      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final article = Article();

      // then
      expect(
            () async {
          await leoMLDocumentParser.parseToColumn(
            leoMLDocument: leoMLDocument,
            template: article,
          );
        },
        throwsA(
          predicate(
                (Exception e) =>
            e is ArticleFirstObjectIsNotHeadlineException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason: 'Expected ArticleFirstObjectIsNotHeadlineException to be thrown',
      );
    });
    test('article does not contains section exception is thrown', () {
      // given
      const leoMLDocument = articleContainsNoSectionJSON;
      const expectedMessage =
          'The article template must contain at least one section object.';
      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final article = Article();

      // then
      expect(
            () async {
          await leoMLDocumentParser.parseToColumn(
            leoMLDocument: leoMLDocument,
            template: article,
          );
        },
        throwsA(
          predicate(
                (Exception e) =>
            e is ArticleDoesNotContainsSectionException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason: 'Expected ArticleDoesNotContainsSectionException to be thrown',
      );
    });
    test('article second object is not sub headline exception is thrown', () {
      // given
      const leoMLDocument = articleSecondObjectIsNotSubHeadlineJSON;
      const expectedMessage =
          'The second object in your article template is not the "subHeadline" object, but your leoML document contains a sub headline.\n\n'
          'It is mandatory, that the second object of each article template is the "sub headline" object, if it exists.';
      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final article = Article();

      // then
      expect(
            () async {
          await leoMLDocumentParser.parseToColumn(
            leoMLDocument: leoMLDocument,
            template: article,
          );
        },
        throwsA(
          predicate(
                (Exception e) =>
            e is ArticleSecondObjectIsNotSubHeadlineException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason: 'Expected ArticleSecondObjectIsNotSubHeadlineException to be thrown',
      );
    });
  });
}