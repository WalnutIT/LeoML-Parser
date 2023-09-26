// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704103425
// 04.07.2023 10:34

/// Exception thrown when a LeoML document is not well-formed and is not a list.
class IsNotListException implements Exception {
  @override
  String toString() => 'Your LeoML document is not well-formed.\n'
      'It must be a list. Each LeoML document must have rectangular brackets at the root.\n\n'
      'For example:\n\n'
      '['
      ' {"name":"value"},'
      ' {"name":"value"}'
      ']';
}
