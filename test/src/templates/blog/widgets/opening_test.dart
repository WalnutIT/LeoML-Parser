// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230723194839
// 23.07.2023 19:48
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/blog/widgets/opening.dart';

void main() {
  group('Positive test', () {
    testWidgets('Opening shows the correct image', (tester) async {
      // given
      const testText = 'test text';

      const openingObject = {
        'text': testText,
        'imageURL':
            'https://zqptkypptrsinuzekand.supabase.co/storage/v1/object/public/photos/Schottland%202023/1.JPG',
      };

      // when
      const widget = MaterialApp(
        home: Opening(object: {'opening': openingObject}),
      );

      await tester.pumpWidget(widget);

      // then
      expect(
        find.widgetWithImage(
          Opening,
          const NetworkImage(
            'https://zqptkypptrsinuzekand.supabase.co/storage/v1/object/public/photos/Schottland%202023/1.JPG',
          ),
        ),
        findsOneWidget,
      );
    });
    testWidgets('Opening shows the correct text', (tester) async {
      // given
      const testText = 'test text';

      const imageObject = {
        'imageURL':
            'https://zqptkypptrsinuzekand.supabase.co/storage/v1/object/public/photos/Schottland%202023/1.JPG',
        'text': testText,
      };

      // when
      const widget = MaterialApp(
        home: Opening(object: {'opening': imageObject}),
      );

      await tester.pumpWidget(widget);

      // then
      expect(
        find.text(testText),
        findsOneWidget,
      );
    });
  });
  group('Negative test', () {
    test(
      'Atomic object validation fails when image url is not type string',
      () {
        // given
        const openingObject = {
          'imageURL': 1,
          'text': 'text',
        };

        // when
        const widget = Opening(object: {'opening': openingObject});

        // then
        expect(
          () {
            widget.validateObject();
          },
          throwsA(isA<AtomicObjectIsNotStringException>()),
        );
      },
    );
    test(
      'Atomic object validation fails when text is not type string',
      () {
        // given
        const imageObject = {
          'imageURL': 'https://my-url.com',
          'text': 1,
        };

        // when
        const widget = Opening(object: {'opening': imageObject});

        // then
        expect(
          () {
            widget.validateObject();
          },
          throwsA(isA<AtomicObjectIsNotStringException>()),
        );
      },
    );
  });
}
