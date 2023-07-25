// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704105714
// 04.07.2023 10:57

/// Exception thrown when the first object in a LeoML document is not the "type" object.
class FirstObjectIsNotTypeException implements Exception {
  @override
  String toString() =>
      'The first object in your LeoML document is not the "type" object.\n\n'
          'It is mandatory, that the first object of each LeoML document is the "type" object.';
}

