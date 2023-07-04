// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083445
// 04.07.2023 08:34
import 'package:leoml_parser/src/templates/content_template.dart';
import 'package:leoml_parser/src/templates/widget_factory.dart';

class Article extends ContentTemplate {
  Article()
      : super(
          type: 'article',
          widgetFactory: LeoMLParserWidgetFactory(),
        );

  @override
  bool assertLeoMLStructure(List parsedLeoMLDocument) {
    return true;
  }
}
