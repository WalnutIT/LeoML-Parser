// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013103603
// 13.10.2023 10:36
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/widgets/h3.dart';

void main() {
  group('Positive test', () {
    testWidgets('h3 shows the correct text', (tester) async {
      // given
      const textToDisplay = 'test text';

      // when
      const widget = MaterialApp(
        home: H3(object: {h3: textToDisplay}),
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
          '\'h3\' is not from type String. Atomic objects must have the data type \'String\'';
      // when
      const widget = H3(object: {h3: textToDisplay});

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