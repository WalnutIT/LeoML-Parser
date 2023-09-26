// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230706095053
// 06.07.2023 09:50

class AtomicObjectIsNotStringException implements Exception {
  /// Creates an `AtomicObjectIsNotStringException` instance.
  ///
  /// The [subTagName] parameter specifies the sub tag name of the atomic object.
  AtomicObjectIsNotStringException({required this.subTagName});

  /// The sub tag name of the atomic object.
  final String subTagName;

  @override
  String toString() =>
      '\'$subTagName\' is not from type String. Atomic objects must have the data type \'String\'';
}
