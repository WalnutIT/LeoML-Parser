// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704172549
// 04.07.2023 17:25

/// Exception thrown when the first object in a LeoML document is not the "headline" object.
class BlogFirstObjectIsNotHeadlineException implements Exception {
  @override
  String toString() =>
      'The first object in your blog template is not the "headline" object.\n\n'
      'It is mandatory, that the first object of each blog template is the "headline" object.';
}
