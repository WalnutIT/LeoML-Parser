// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013103654
// 13.10.2023 10:36
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/widgets/li.dart';

void main() {
  group('Positive test', () {
    testWidgets('bullet list shows the correct items', (tester) async {
      // given
      const textToDisplay = [
        'text 1',
        'text 2',
        'text 3',
      ];

      // when
      const widget = MaterialApp(
        home: Li(object: {li: textToDisplay}),
      );

      await tester.pumpWidget(widget);

      // then
      expect(find.text('\u2022 text 1'), findsOneWidget);
      expect(find.text('\u2022 text 2'), findsOneWidget);
      expect(find.text('\u2022 text 3'), findsOneWidget);
    });
  });
  group('Negative test', () {
    test('Atomic object validation fails', () {
      // given
      const textToDisplay = [
        1,
        'text 2',
        2.0,
      ];

      const expectedMessage =
          '\'li\' is not from type String. Atomic objects must have the data type \'String\'';

      // when
      const widget = Li(object: {li: textToDisplay});

      // then
      expect(
        () {
          widget.validateObject();
        },
        throwsA(
          predicate(
            (Exception e) =>
                e is AtomicObjectIsNotStringException &&
                e.toString() == expectedMessage,
          ),
        ),
      );
    });
  });
}
