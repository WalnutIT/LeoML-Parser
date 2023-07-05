// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230705083751
// 05.07.2023 08:37
import 'package:leoml_parser/src/exception/i_exception.dart';

class BlogDoesNotContainsSubHeadlineException implements IException {
  @override
  String get msg =>
      'The blog template must contain at least one sub headline object.';
}
