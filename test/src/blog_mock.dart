// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704120142
// 04.07.2023 12:01
import 'package:leoml_parser/src/templates/content_template.dart';

class BlogMock extends ContentTemplate {
  BlogMock({required super.type, required super.widgetFactory});

  @override
  bool assertLeoMLStructure(List parsedLeoMLDocument) {
    return true;
  }
}
