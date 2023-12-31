// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704191814
// 04.07.2023 19:18

/// Exception thrown when the first object in a LeoML document is not the "headline" object.
class BlogSecondObjectIsNotOpeningException implements Exception {
  @override
  String toString() =>
      'The second object in your blog template is not the "opening" object.\n\n'
      'It is mandatory, that the second object of each blog template is the "opening" object.';
}
