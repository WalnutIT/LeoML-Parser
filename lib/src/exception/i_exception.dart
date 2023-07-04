// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704103522
// 04.07.2023 10:35
/// An abstract class representing a custom exception.
abstract class IException implements Exception {
  /// The message associated with the exception.
  final String msg;

  /// Constructs an instance of [IException] with the specified message.
  const IException({required this.msg});

  @override
  String toString() => msg;
}

