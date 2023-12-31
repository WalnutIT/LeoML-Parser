// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230803202732
// 03.08.2023 20:27
class ArticleDoesNotContainsSectionException implements Exception {
  @override
  String toString() =>
      'The article template must contain at least one section object.';
}
