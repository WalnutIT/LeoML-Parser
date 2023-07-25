// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230723133223
// 23.07.2023 13:32
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/widgets/citation.dart';

void main() {
  group('Positive test', () {
    testWidgets('citation shows the correct text', (tester) async {
      // given
      const textToDisplay = 'test text';

      // when
      const widget = MaterialApp(
        home: Citation(object: {'citation': textToDisplay}),
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
          '\'citation\' is not from type String. Atomic objects must have the data type \'String\'';
      // when
      const widget = Citation(object: {'citation': textToDisplay});

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
