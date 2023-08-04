// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230707105448
// 07.07.2023 10:54
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/widget_builder/widget_factory.dart';

class MockWidgetFactory extends WidgetFactory{
  @override
  Widget buildDefaultWidget({required String key, required Map object}) {
    return  Container();
  }

}