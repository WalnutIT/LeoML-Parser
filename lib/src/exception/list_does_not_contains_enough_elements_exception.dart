// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230705084330
// 05.07.2023 08:43

class ListDoesNotContainsEnoughElementsException implements Exception {
  @override
  String toString() => 'A list must contain at least 2 elements.';
}
