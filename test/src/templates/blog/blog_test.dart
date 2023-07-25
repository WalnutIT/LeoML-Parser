// Project: LeoML Parser
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
  //group('positive tests', () {});

  group('negative tests', () {
    test('first object is not a headline exception is thrown', () {
      // given
      const leoMLDocument = blogFirstObjectIsNotHeadlineJSON;
      const expectedMessage =
          'The first object in your blog template is not the "headline" object.\n\n'
          'It is mandatory, that the first object of each blog template is the "headline" object.';
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
        throwsA(
          predicate(
            (Exception e) =>
                e is BlogFirstObjectIsNotHeadlineException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason: 'Expected BlogFirstObjectIsNotHeadlineException to be thrown',
      );
    });
    test('second object is not an opening exception is thrown', () {
      // given
      const leoMLDocument = blogSecondObjectIsNotOpeningJSON;
      const expectedMessage =
          'The second object in your blog template is not the "opening" object.\n\n'
          'It is mandatory, that the second object of each blog template is the "opening" object.';

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
        throwsA(
          predicate(
            (Exception e) =>
                e is BlogSecondObjectIsNotOpeningException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason: 'Expected BlogSecondObjectIsNotOpeningException to be thrown',
      );
    });
    test('opening does not contains a text tag exception is thrown', () {
      // given
      const leoMLDocument = openingDoesNotContainsTextTagJSON;
      const expectedMessage = 'The opening object must contain the "text" tag.';

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
        throwsA(
          predicate(
            (Exception e) =>
                e is BlogOpeningDoesNotContainsTextTagException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason:
            'Expected BlogOpeningDoesNotContainsTextTagException to be thrown',
      );
    });
    test(
        'the blog template does not contains at least one sub headline exception is thrown',
        () {
        // given
        const leoMLDocument =
            blogTemplateDoesNotContainsAtLeastOneSubHeadlineJSON;
        const expectedMessage =
            'The blog template must contain at least one sub headline object.';

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
          throwsA(
            predicate(
              (Exception e) =>
                  e is BlogDoesNotContainsSubHeadlineException &&
                  e.toString() == expectedMessage,
            ),
          ),
          reason:
              'Expected BlogDoesNotContainsSubHeadlineException to be thrown',
        );
      },
    );
    test(
      'the blog template does not contains at leat one section exception is not thrown',
      () {
        // given
        const leoMLDocument = blogTemplateDoesNotContainsAtLeastOneSectionJSON;
        const expectedMessage =
            'The opening object must contain the "text" tag.';

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
          throwsA(
            predicate(
              (Exception e) =>
                  e is BlogDoesNotContainsSectionException &&
                  e.toString() == expectedMessage,
            ),
          ),
          reason: 'Expected BlogDoesNotContainsSectionException to be thrown',
        );
      },
    );
    test('List does not contains enough elements exception is thrown', () {
      // given
      const leoMLDocument = listDoesNotContainsEnoughElementsJSON;
      const expectedMessage = 'A list must contain at least 2 elements.';

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
        throwsA(
          predicate(
            (Exception e) =>
                e is ListDoesNotContainsEnoughElementsException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason:
            'Expected ListDoesNotContainsEnoughElementException to be thrown',
      );
    });
    test('Image url is missing exception is thrown', () {
      // given
      const leoMLDocument = imageURLIsMissingJSON;
      const expectedMessage =
          'Your image object does not provides an image url.\n'
          'Please add an image url.';

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
        throwsA(
          predicate(
            (Exception e) =>
                e is ImageURLIsMissingException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason: 'Expected ImageURLIsMissingException to be thrown',
      );
    });
  });
}
