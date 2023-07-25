// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230707102240
// 07.07.2023 10:22

class WidgetMapDoesNotContainsRequestedKeyException implements Exception {
  const WidgetMapDoesNotContainsRequestedKeyException({
    required this.requestedTagName,
  });

  final String requestedTagName;

  @override
  String toString() =>
      'The widget map does not contains the key"$requestedTagName". Please add the key or check, if the key is written correctly.';
}
