// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083445
// 04.07.2023 08:34
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/content_template.dart';
import 'package:leoml_parser/src/templates/widget_factory.dart';

class Article extends ContentTemplate {
  Article({
    this.headline,
    this.subHeadline,
    this.sectionHeadline,
    this.section,
    this.catchLine,
    this.image,
    this.list,
    this.citation,
  }) : super(
          type: 'article',
          widgetFactory: LeoMLParserWidgetFactory(),
        );

  final Widget? headline;

  final Widget? subHeadline;

  final Widget? sectionHeadline;

  final Widget? section;

  final Widget? catchLine;

  final Widget? list;

  final Widget? citation;

  final Widget? image;

  @override
  bool assertLeoMLStructure(List parsedLeoMLDocument) {
    return true;
  }

  @override
  Widget createCustomWidget({required String key, required Map object}) {
    // TODO: implement createCustomWidget
    throw UnimplementedError();
  }

  @override
  bool hasCustomWidget({required String key}) {
    // TODO: implement hasCustomWidget
    throw UnimplementedError();
  }
}
