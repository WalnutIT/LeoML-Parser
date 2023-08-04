// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704100402
// 04.07.2023 10:04
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:leoml_parser/src/exception/first_object_is_not_type_exception.dart';
import 'package:leoml_parser/src/exception/is_not_list_exception.dart';
import 'package:leoml_parser/src/exception/type_does_not_match_exception.dart';
import 'package:leoml_parser/src/widget_builder/widget_factory.dart';

import '../test_documents/blog/blog_1.dart';
import '../test_documents/first_object_is_not_type_json.dart';
import '../test_documents/not_a_list_json.dart';
import '../test_documents/type_does_not_match_json.dart';
import 'blog_mock.dart';

void main() {
  group('positive tests', () {
    test('should return a column', () async {
      // given
      const leoMLDocument = blog1;
      const expectedLength = 23;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      const defaultWidgetFactory = LeoMLParserDefaultWidgetFactory();
      final blog = MockBlog(
        type: 'blog',
        defaultWidgetFactory: defaultWidgetFactory,
      );

      final result = await leoMLDocumentParser.parseToColumn(
        leoMLDocument: leoMLDocument,
        template: blog,
      );

      // then
      expect(
        result.children.isNotEmpty,
        isTrue,
        reason: 'Expected result to be a non empty list',
      );
      expect(
        result.children.length == expectedLength,
        isTrue,
        reason: 'Expected a list length of 23',
      );
    });

    test('should return a set of widgets', () async {
      // given
      const leoMLDocument = blog1;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      const defaultWidgetFactory = LeoMLParserDefaultWidgetFactory();
      final blog = MockBlog(
        type: 'blog',
        defaultWidgetFactory: defaultWidgetFactory,
      );

      final result = await leoMLDocumentParser.parseToSet(
        leoMLDocument: leoMLDocument,
        template: blog,
      );

      // then
      expect(
        result.isNotEmpty,
        isTrue,
        reason: 'Expected result to be a Set of widgets',
      );
    });
  });

  group('negative tests', () {
    test('should throw an IsNotListException', () {
      // given
      const leoMLDocument = notAListJSON;
      const expectedMessage = 'Your LeoML document is not well-formed.\n'
          'It must be a list. Each LeoML document must have rectangular brackets at the root.\n\n'
          'For example:\n\n'
          '['
          ' {"name":"value"},'
          ' {"name":"value"}'
          ']';

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
                e is IsNotListException && e.toString() == expectedMessage,
          ),
        ),
        reason: 'Expected IsNotListException to be thrown',
      );
    });

    test('should throw a FirstObjectIsNotTypeException', () {
      // given
      const leoMLDocument = firstObjectIsNotType;
      const expectedMessage =
          'The first object in your LeoML document is not the "type" object.\n\n'
          'It is mandatory, that the first object of each LeoML document is the "type" object.';

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
                e is FirstObjectIsNotTypeException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason: 'Expected FirstObjectIsNotTypeException to be thrown',
      );
    });

    test('should throw a TypeDoesNotMatchException', () {
      // given
      const leoMLDocument = typeDoesNotMatchJSON;
      const expectedMessage =
          'The type of the LeoML document and the template type '
          'don\'t match.\n\n'
          'This can happen when your LeoML document is of type "blog" and your'
          'template type is "article".';

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
                e is TypeDoesNotMatchException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason: 'Expected TypeDoesNotMatchException to be thrown',
      );
    });
  });
}
