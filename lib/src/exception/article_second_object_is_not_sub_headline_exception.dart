// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230804133626
// 04.08.2023 13:36
/// Exception thrown when the first object in a LeoML document is not the "headline" object.
class ArticleSecondObjectIsNotSubHeadlineException implements Exception {
  @override
  String toString() =>
      'The second object in your article template is not the "subHeadline" object, but your leoML document contains a sub headline.\n\n'
      'It is mandatory, that the second object of each article template is the "sub headline" object, if it exists.';
}
