// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704120142
// 04.07.2023 12:01
import 'package:flutter/src/widgets/framework.dart';
import 'package:leoml_parser/src/templates/content_template.dart';

class MockBlog extends ContentTemplate {
  MockBlog({required super.type, required super.widgetFactory});

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
