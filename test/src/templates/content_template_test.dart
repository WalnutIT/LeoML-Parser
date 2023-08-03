// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230707104401
// 07.07.2023 10:44
import 'package:flutter_test/flutter_test.dart';

import '../../test_documents/blog/blog_1.dart';
import 'blog/mock_widget_factory.dart';
import 'test_content_template_impl.dart';

void main() {
  group('positive tests', () {
    test('type is correctly set', () {
      // given
      const expected = 'blog';

      // when
      final widgetsFactory = MockWidgetFactory();
      final testContentTemplateImpl = TestContentTemplateImpl(
        type: expected,
        widgetFactory: widgetsFactory,
      );
      final result = testContentTemplateImpl.type;
      // then
      expect(result, equals(expected));
    });
    test('widget factory is set.', () {
      // given

      // when
      final widgetsFactory = MockWidgetFactory();
      final testContentTemplateImpl = TestContentTemplateImpl(
        type: 'blog',
        widgetFactory: widgetsFactory,
      );

      final result = testContentTemplateImpl.widgetFactory;
      // then
      expect(result, isNotNull);
    });
    test('parse to column method returns a column', () {
      // given
      var parsedLeoMLDocument = blog1AsList;
      // when
      final widgetsFactory = MockWidgetFactory();
      final testContentTemplateImpl = TestContentTemplateImpl(
        type: 'blog',
        widgetFactory: widgetsFactory,
      );
      final result = testContentTemplateImpl.parseToColumn(
        parsedLeoMLDocument: parsedLeoMLDocument,
      );
      // then
      expect(result.children.isNotEmpty, isTrue);
    });
    test('parse to set method returns a Set', () {
      // given
      const parsedLeoMLDocument = blog1AsList;
      // when
      final widgetsFactory = MockWidgetFactory();
      final testContentTemplateImpl = TestContentTemplateImpl(
        type: 'blog',
        widgetFactory: widgetsFactory,
      );
      final result = testContentTemplateImpl.parseToSet(
        parsedLeoMLDocument: parsedLeoMLDocument,
      );
      // then
      expect(result.isNotEmpty, isTrue);
    });
  });
}
