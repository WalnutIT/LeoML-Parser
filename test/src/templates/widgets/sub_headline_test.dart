// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230723135747
// 23.07.2023 13:57
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/widgets/sub_headline.dart';

void main() {
  group('Positive test', () {
    testWidgets('sub headline shows the correct text', (tester) async {
      // given
      const textToDisplay = 'test text';

      // when
      const widget = MaterialApp(
        home: SubHeadline(object: {'subHeadline': textToDisplay}),
      );

      await tester.pumpWidget(widget);

      // then
      expect(find.text(textToDisplay), findsOneWidget);
    });
  });
  group('Negative test', () {
    test('Atomic object validation fails', () {
      // given
      const textToDisplay = 1;

      // when
      const widget = SubHeadline(object: {'subHeadline': textToDisplay});

      // then
      expect(
        () {
          widget.validateObject();
        },
        throwsA(isA<AtomicObjectIsNotStringException>()),
      );
    });
  });
}
