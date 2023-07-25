// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230723135712
// 23.07.2023 13:57
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/widgets/image.dart';

void main() {
  group('Positive test', () {
    testWidgets('LeoImage shows the correct image', (tester) async {
      // given
      const imageObject = {
        'imageURL':
            'https://zqptkypptrsinuzekand.supabase.co/storage/v1/object/public/photos/Schottland%202023/1.JPG',
      };

      // when
      const widget = MaterialApp(
        home: LeoImage(object: {'image': imageObject}),
      );

      await tester.pumpWidget(widget);

      // then
      expect(
        find.widgetWithImage(
          LeoImage,
          const NetworkImage(
            'https://zqptkypptrsinuzekand.supabase.co/storage/v1/object/public/photos/Schottland%202023/1.JPG',
          ),
        ),
        findsOneWidget,
      );
    });
    testWidgets('LeoImage shows the correct image description', (tester) async {
      // given
      const testDescription = 'test description';

      const imageObject = {
        'imageURL':
            'https://zqptkypptrsinuzekand.supabase.co/storage/v1/object/public/photos/Schottland%202023/1.JPG',
        'imageDescription': testDescription,
      };

      // when
      const widget = MaterialApp(
        home: LeoImage(object: {'image': imageObject}),
      );

      await tester.pumpWidget(widget);

      // then
      expect(
        find.text(testDescription),
        findsOneWidget,
      );
    });
  });
  group('Negative test', () {
    test(
      'Atomic object validation fails when image url is not type string',
      () {
        // given
        const imageObject = {
          'imageURL': 1,
        };

        // when
        const widget = LeoImage(object: {'image': imageObject});

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
      'Atomic object validation fails when image description is not type string',
      () {
        // given
        const imageObject = {
          'imageURL': 'https://my-url.com',
          'imageDescription': 1,
        };

        // when
        const widget = LeoImage(object: {'image': imageObject});

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
