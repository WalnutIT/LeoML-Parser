// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013103548
// 13.10.2023 10:35
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/widgets/h1.dart';

void main() {
  group('Positive test', () {
    testWidgets('h1 shows the correct text', (tester) async {
      // given
      const textToDisplay = 'test text';

      // when
      const widget = MaterialApp(
        home: H1(object: {h1: textToDisplay}),
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
      const expectedMessage =
          '\'h1\' is not from type String. Atomic objects must have the data type \'String\'';
      // when
      const widget = H1(object: {h1: textToDisplay});

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