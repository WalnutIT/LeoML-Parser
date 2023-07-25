// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704104513
// 04.07.2023 10:45

/// Exception thrown when the type of a LeoML document does not match the template type.
class TypeDoesNotMatchException implements Exception {

  TypeDoesNotMatchException();

  @override
  String toString() => 'The type of the LeoML document and the template type '
      'don\'t match.\n\n'
      'This can happen when your LeoML document is of type "blog" and your'
      'template type is "article".';
}
