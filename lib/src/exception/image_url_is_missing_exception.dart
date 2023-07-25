// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230705084535
// 05.07.2023 08:45

class ImageURLIsMissingException implements Exception {
  @override
  String toString() => 'Your image object does not provides an image url.\n'
      'Please add an image url.';
}
