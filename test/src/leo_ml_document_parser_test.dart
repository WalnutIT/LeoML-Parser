// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704100402
// 04.07.2023 10:04
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:leoml_parser/src/exception/first_object_is_not_type_exception.dart';
import 'package:leoml_parser/src/exception/is_not_list_exception.dart';
import 'package:leoml_parser/src/exception/type_does_not_match_exception.dart';
import 'package:leoml_parser/src/templates/widget_factory.dart';

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
      final widgetFactory = LeoMLParserWidgetFactory();
      final blog = BlogMock(
        type: 'blog',
        widgetFactory: widgetFactory,
      );

      final result = await leoMLDocumentParser.parseToColumn(
        leoMLDocument: leoMLDocument,
        template: blog,
      );

      // then
      expect(result.children.isNotEmpty, isTrue,
          reason: 'Expected result to be a non empty list');
      expect(result.children.length == expectedLength, isTrue,
          reason: 'Expected a list length of 23');
    });

    test('should return a set of widgets', () async {
      // given
      const leoMLDocument = blog1;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final widgetFactory = LeoMLParserWidgetFactory();
      final blog = BlogMock(
        type: 'blog',
        widgetFactory: widgetFactory,
      );

      final result = await leoMLDocumentParser.parseToSet(
        leoMLDocument: leoMLDocument,
        template: blog,
      );

      // then
      expect(result is Set<Widget>, isTrue,
          reason: 'Expected result to be a Set of widgets');
    });
  });

  group('negative tests', () {
    test('should throw an IsNotListException', () {
      // given
      const leoMLDocument = notAListJSON;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final blog = Blog();

      // then
      expect(() async {
        await leoMLDocumentParser.parseToColumn(
          leoMLDocument: leoMLDocument,
          template: blog,
        );
      }, throwsA(const TypeMatcher<IsNotListException>()),
          reason: 'Expected IsNotListException to be thrown');
    });

    test('should throw a FirstObjectIsNotTypeException', () {
      // given
      const leoMLDocument = firstObjectIsNotType;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final blog = Blog();

      // then
      expect(() async {
        await leoMLDocumentParser.parseToColumn(
          leoMLDocument: leoMLDocument,
          template: blog,
        );
      }, throwsA(const TypeMatcher<FirstObjectIsNotTypeException>()),
          reason: 'Expected FirstObjectIsNotTypeException to be thrown');
    });

    test('should throw a TypeDoesNotMatchException', () {
      // given
      const leoMLDocument = typeDoesNotMatchJSON;

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final blog = Blog();

      // then
      expect(() async {
        await leoMLDocumentParser.parseToColumn(
          leoMLDocument: leoMLDocument,
          template: blog,
        );
      }, throwsA(const TypeMatcher<TypeDoesNotMatchException>()),
          reason: 'Expected TypeDoesNotMatchException to be thrown');
    });
  });
}
