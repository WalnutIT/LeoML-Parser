// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230803202840
// 03.08.2023 20:28
/// Exception thrown when the first object in a LeoML article document is not the "headline" object.
class ArticleFirstObjectIsNotHeadlineException implements Exception {
  @override
  String toString() =>
      'The first object in your article template is not the "headline" object.\n\n'
      'It is mandatory, that the first object of each article template is the "headline" object.';
}
