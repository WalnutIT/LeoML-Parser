// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231019083119
// 19.10.2023 08:31
import 'package:example/custom_widgets/my_custom_headline.dart';
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

class MyCustomHeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomHeadline(object: object)..validateObject();
}
