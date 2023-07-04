// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083445
// 04.07.2023 08:34
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/content_template.dart';

class Article extends ContentTemplate {
  Article() : super(type: 'blog');

  @override
  Column parseToColumn({required List parsedLeoMLDocument}) {
    // TODO: implement parseToColumn
    throw UnimplementedError();
  }

  @override
  Set<Widget> parseToSet({required List parsedLeoMLDocument}) {
    // TODO: implement parseToSet
    throw UnimplementedError();
  }
}
