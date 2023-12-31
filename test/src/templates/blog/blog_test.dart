// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230705085949
// 05.07.2023 08:59
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/exception/blog_does_not_contains_section_exception.dart';
import 'package:leoml_parser/src/exception/blog_does_not_contains_sub_headline_exception.dart';
import 'package:leoml_parser/src/exception/blog_first_object_is_not_headline_exception.dart';
import 'package:leoml_parser/src/exception/blog_opening_does_not_contains_text_tag_exception.dart';
import 'package:leoml_parser/src/exception/blog_second_object_is_not_opening_exception.dart';
import 'package:leoml_parser/src/exception/image_url_is_missing_exception.dart';
import 'package:leoml_parser/src/exception/list_does_not_contains_enough_elements_exception.dart';
import 'package:leoml_parser/src/leo_ml_document_parser.dart';
import 'package:leoml_parser/src/templates/blog/blog.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';

import '../../../custom_widgets.dart';
import '../../../test_documents/blog/blog_1.dart';
import '../../../test_documents/blog/blog_first_object_is_not_headline_json.dart';
import '../../../test_documents/blog/blog_image.dart';
import '../../../test_documents/blog/blog_list.dart';
import '../../../test_documents/blog/blog_opening_does_not_contains_text_tag_json.dart';
import '../../../test_documents/blog/blog_second_object_is_not_opening_json.dart';
import '../../../test_documents/blog/blog_template_does_not_contain_one_section_json.dart';
import '../../../test_documents/blog/blog_template_does_not_contains_at_least_one_sub_headline_json.dart';
import '../../../test_documents/image_url_is_missing_json.dart';
import '../../../test_documents/list_does_not_contains_enough_elements_json.dart';

void main() {
  group('positive tests', () {
    test("has custom widget 'headline'", () {
      // given
      const key = 'headline';

      // when
      final blog = Blog(headlineBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'opening'", () {
      // given
      const key = 'opening';

      // when
      final blog = Blog(openingBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'subHeadline'", () {
      // given
      const key = 'subHeadline';

      // when
      final blog = Blog(subHeadlineBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'section'", () {
      // given
      const key = 'section';

      // when
      final blog = Blog(sectionBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'list'", () {
      // given
      const key = 'list';

      // when
      final blog = Blog(listBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'citation'", () {
      // given
      const key = 'citation';

      // when
      final blog = Blog(citationBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'image'", () {
      // given
      const key = 'image';

      // when
      final blog = Blog(imageBuilder: MyCustomTestWidget());
      final actual = blog.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test('is returning the headline widget', () {
      // given
      const key = 'headline';
      final listOfObjects = jsonDecode(blog1) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final blog = Blog(headlineBuilder: MyCustomHeadlineBuilder());
      final actual = blog.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomHeadline, isTrue);
    });
    test('is returning the opening widget', () {
      // given
      const key = 'opening';
      final listOfObjects = jsonDecode(blog1) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final blog = Blog(openingBuilder: MyCustomOpeningWidget());
      final actual = blog.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomOpening, isTrue);
    });
    test('is returning the subHeadline widget', () {
      // given
      const key = 'subHeadline';
      final listOfObjects = jsonDecode(blog1) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final blog = Blog(subHeadlineBuilder: MyCustomSubHeadlineBuilder());
      final actual = blog.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomSubHeadline, isTrue);
    });
    test('is returning the section widget', () {
      // given
      const key = 'section';
      final listOfObjects = jsonDecode(blog1) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final blog = Blog(sectionBuilder: MyCustomSectionBuilder());
      final actual = blog.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomSection, isTrue);
    });
    test('is returning the list widget', () {
      // given
      const key = 'list';
      final listOfObjects = jsonDecode(blogList) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final blog = Blog(listBuilder: MyCustomListBuilder());
      final actual = blog.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomList, isTrue);
    });
    test('is returning the citation widget', () {
      // given
      const key = 'citation';
      final listOfObjects = jsonDecode(blog1) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final blog = Blog(citationBuilder: MyCustomCitationBuilder());
      final actual = blog.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomCitation, isTrue);
    });
    test('is returning the image widget', () {
      // given
      const key = 'image';
      final listOfObjects = jsonDecode(blogImage) as List;
      var object = {};

      object = listOfObjects.firstWhere((element) {
        if ((element as Map).containsKey(key)) {
          return true;
        }

        return false;
      });

      // when
      final blog = Blog(imageBuilder: MyCustomImageWidget());
      final actual = blog.buildCustomWidget(key: key, object: object);

      // then
      expect(actual is MyCustomImage, isTrue);
    });
  });

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
      'the blog template does not contains at least one section exception is thrown',
      () {
        // given
        const leoMLDocument = blogTemplateDoesNotContainsAtLeastOneSectionJSON;
        const expectedMessage =
            'The blog template must contain at least one section object.';

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

class MyCustomTestWidget extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) =>
      MyCustomTestWidgetTemplate(object: object);
}

class MyCustomTestWidgetTemplate extends StatelessWidgetTemplate {
  const MyCustomTestWidgetTemplate({super.key, required super.object});

  @override
  Widget build(BuildContext context) => const Text(
        'test text',
        style: TextStyle(
          color: Colors.green,
          fontSize: 44.0,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  void validateObject() {
    throw UnimplementedError();
  }
}

class MyCustomHeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) => MyCustomHeadline(object: object);
}

class MyCustomHeadline extends StatelessWidgetTemplate {
  const MyCustomHeadline({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object['headline'],
        style: const TextStyle(
          color: Colors.green,
          fontSize: 44.0,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  void validateObject() {
    if (object['headline'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'headline',
      );
    }
  }
}

class MyCustomOpeningWidget extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) => MyCustomOpening(object: object);
}

class MyCustomOpening extends StatelessWidgetTemplate {
  const MyCustomOpening({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object['opening']['text'],
      );

  @override
  void validateObject() {
    if (object['opening'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'opening',
      );
    }
  }
}
