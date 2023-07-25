// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230705084022
// 05.07.2023 08:40

class BlogDoesNotContainsSectionException implements Exception {
  @override
  String toString() =>
      'The blog template must contain at least one section object.';
}