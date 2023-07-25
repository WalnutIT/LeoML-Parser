// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230707074812
// 07.07.2023 07:48
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/widget_map_does_not_contains_requested_key_exception.dart';
import 'package:leoml_parser/src/templates/widget_factory.dart';
import 'package:leoml_parser/src/templates/widgets/headline.dart';

void main() {
  group('positive tests', () {
    test('check if widget map returns the requested widget', () {
      // given
      const key = 'headline';
      const object = {'headline': 'My headline'};

      // when
      final widgetFactory = LeoMLParserWidgetFactory();
      final result = widgetFactory.createWidget(key: key, object: object);
      // then
      expect(result is Headline, isTrue);
    });
  });
  group('negative tests', () {
    test('check if widget map contains requested key exception is thrown', () {
      // given
      const key = 'test';
      const object = {'headline': 'My headline'};
      const expectedMessage =
          'The widget map does not contains the key"$key". Please add the key or check, if the key is written correctly.';
      // when
      final widgetFactory = LeoMLParserWidgetFactory();

      // then
      expect(
        () {
          widgetFactory.createWidget(
            key: key,
            object: object,
          );
        },
        throwsA(
          predicate(
            (Exception e) =>
                e is WidgetMapDoesNotContainsRequestedKeyException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason:
            'Expected WidgetMapDoesNotContainsRequestedKeyException to be thrown',
      );
    });
  });
}
