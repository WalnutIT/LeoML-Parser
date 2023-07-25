// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230723135722
// 23.07.2023 13:57
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/widgets/list.dart';

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
        home: BulletList(object: {'list': textToDisplay}),
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

      // when
      const widget = BulletList(object: {'list': textToDisplay});

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
