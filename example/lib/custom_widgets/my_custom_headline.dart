// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231019082946
// 19.10.2023 08:29
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

class MyCustomHeadline extends StatelessWidgetTemplate {
  const MyCustomHeadline({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
    object['headline'],
    style: const TextStyle(
      color: Colors.green,
      fontSize: 44.0,
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  void validateObject() {
    if (object[headline] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'headline',
      );
    }
  }
}