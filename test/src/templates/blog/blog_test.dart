// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230705085949
// 05.07.2023 08:59
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/blog_does_not_contains_section_exception.dart';
import 'package:leoml_parser/src/exception/blog_does_not_contains_sub_headline_exception.dart';
import 'package:leoml_parser/src/exception/blog_first_object_is_not_headline_exception.dart';
import 'package:leoml_parser/src/exception/blog_opening_does_not_contains_text_tag_exception.dart';
import 'package:leoml_parser/src/exception/blog_second_object_is_not_opening_exception.dart';
import 'package:leoml_parser/src/exception/image_url_is_missing_exception.dart';
import 'package:leoml_parser/src/exception/list_does_not_contains_enough_elements_exception.dart';
import 'package:leoml_parser/src/leo_ml_document_parser.dart';
import 'package:leoml_parser/src/templates/blog/blog.dart';

import '../../../test_documents/blog/blog_first_object_is_not_headline_json.dart';
import '../../../test_documents/blog/blog_opening_does_not_contains_text_tag_json.dart';
import '../../../test_documents/blog/blog_second_object_is_not_opening_json.dart';
import '../../../test_documents/blog/blog_template_does_not_contain_one_section_json.dart';
import '../../../test_documents/blog/blog_template_does_not_contains_at_least_one_sub_headline_json.dart';
import '../../../test_documents/image_url_is_missing_json.dart';
import '../../../test_documents/list_does_not_contains_enough_elements_json.dart';

void main() {
  group('positive tests', () {});

  group('negative tests', () {
    test('first object is not a headline exception is thrown', () {
      // given
      const leoMLDocument = blogFirstObjectIsNotHeadlineJSON;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final blog = Blog();

      // then
      expect(
        () async {
          await leoMLDocumentParser.parseToColumn(
            leoMLDocument: leoMLDocument,
            template: blog,
          );
        },
        throwsA(const TypeMatcher<BlogFirstObjectIsNotHeadlineException>()),
        reason: 'Expected BlogFirstObjectIsNotHeadlineException to be thrown',
      );
    });
    test('second object is not an opening exception is thrown', () {
      // given
      const leoMLDocument = blogSecondObjectIsNotOpeningJSON;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final blog = Blog();

      // then
      expect(
            () async {
          await leoMLDocumentParser.parseToColumn(
            leoMLDocument: leoMLDocument,
            template: blog,
          );
        },
        throwsA(const TypeMatcher<BlogSecondObjectIsNotOpeningException>()),
        reason: 'Expected BlogSecondObjectIsNotOpeningException to be thrown',
      );
    });
    test('opening does not contains a text tag exception is thrown', () {
      // given
      const leoMLDocument = openingDoesNotContainsTextTagJSON;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final blog = Blog();

      // then
      expect(
            () async {
          await leoMLDocumentParser.parseToColumn(
            leoMLDocument: leoMLDocument,
            template: blog,
          );
        },
        throwsA(const TypeMatcher<BlogOpeningDoesNotContainsTextTagException>()),
        reason: 'Expected BlogOpeningDoesNotContainsTextTagException to be thrown',
      );
    });
    test(
        'the blog template does not contains at least one sub headline exception is thrown',
        () {
          // given
          const leoMLDocument = blogTemplateDoesNotContainsAtLeastOneSubHeadlineJSON;

          // when
          final leoMLDocumentParser = LeoMLDocumentParser();
          final blog = Blog();

          // then
          expect(
                () async {
              await leoMLDocumentParser.parseToColumn(
                leoMLDocument: leoMLDocument,
                template: blog,
              );
            },
            throwsA(const TypeMatcher<BlogDoesNotContainsSubHeadlineException>()),
            reason: 'Expected BlogDoesNotContainsSubHeadlineException to be thrown',
          );
    });
    test(
        'the blog template does not contains at leat one section exception is not thrown',
        () {
          // given
          const leoMLDocument = blogTemplateDoesNotContainsAtLeastOneSectionJSON;

          // when
          final leoMLDocumentParser = LeoMLDocumentParser();
          final blog = Blog();

          // then
          expect(
                () async {
              await leoMLDocumentParser.parseToColumn(
                leoMLDocument: leoMLDocument,
                template: blog,
              );
            },
            throwsA(const TypeMatcher<BlogDoesNotContainsSectionException>()),
            reason: 'Expected BlogDoesNotContainsSectionException to be thrown',
          );
    });
    test('List does not contains enough elements exception is thrown', () {
      // given
      const leoMLDocument = listDoesNotContainsEnoughElementsJSON;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final blog = Blog();

      // then
      expect(
            () async {
          await leoMLDocumentParser.parseToColumn(
            leoMLDocument: leoMLDocument,
            template: blog,
          );
        },
        throwsA(const TypeMatcher<ListDoesNotContainsEnoughElementException>()),
        reason: 'Expected ListDoesNotContainsEnoughElementException to be thrown',
      );
    });
    test('Image url is missing exception is thrown', () {
      // given
      const leoMLDocument = imageURLIsMissingJSON;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final blog = Blog();

      // then
      expect(
            () async {
          await leoMLDocumentParser.parseToColumn(
            leoMLDocument: leoMLDocument,
            template: blog,
          );
        },
        throwsA(const TypeMatcher<ImageURLIsMissingException>()),
        reason: 'Expected ImageURLIsMissingException to be thrown',
      );
    });
  });
}
