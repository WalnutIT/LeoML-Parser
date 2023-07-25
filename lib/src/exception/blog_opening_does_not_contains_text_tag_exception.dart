// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704192356
// 04.07.2023 19:23

class BlogOpeningDoesNotContainsTextTagException implements Exception {
  @override
  String toString() => 'The opening object must contain the "text" tag.';
}
