// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704105425
// 04.07.2023 10:54
import 'package:leoml_parser/src/exception/i_exception.dart';

/// Exception thrown when a LeoML document is not well-formed and contains a non-object element in a list.
class IsNotObjectException implements IException {
  @override
  String get msg => 'Your LeoML document is not well-formed.\n'
      'The list must contain objects. \n\n'
      'For example:\n\n'
      '['
      ' {"type":"blog"},'
      ']';
}

