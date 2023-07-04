// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704172549
// 04.07.2023 17:25
import 'package:leoml_parser/src/exception/i_exception.dart';

/// Exception thrown when the first object in a LeoML document is not the "headline" object.
class BlogFirstObjectIsNotHeadlineException implements IException {
  @override
  String get msg =>
      'The first object in your blog template is not the "headline" object.\n\n'
      'It is mandatory, that the first object of each blog template is the "headline" object.';
}
