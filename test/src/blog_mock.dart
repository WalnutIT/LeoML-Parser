// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704120142
// 04.07.2023 12:01
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/content_template.dart';

class BlogMock extends ContentTemplate {
  BlogMock({required super.type});

  @override
  Column parseToColumn({required List parsedLeoMLDocument}) {
    return const Column();
  }

  @override
  Set<Widget> parseToSet({required List parsedLeoMLDocument}) {
    return <Widget>{};
  }
}
