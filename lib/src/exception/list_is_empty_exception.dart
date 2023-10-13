// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013102453
// 13.10.2023 10:24
/// Exception thrown when an operation expects a list to contain elements, but the list is empty.
class ListIsEmptyException implements Exception {
  @override
  String toString() => 'List is empty.';
}
