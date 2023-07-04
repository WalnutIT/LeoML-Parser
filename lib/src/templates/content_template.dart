// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083502
// 04.07.2023 08:35
import 'package:flutter/widgets.dart';

/// An abstract class representing a content template.
abstract class ContentTemplate {
  /// Creates a `ContentTemplate` instance.
  ///
  /// The [type] parameter specifies the type of the content template.
  ContentTemplate({required this.type});

  /// The type of the content template.
  final String type;

  /// Parses the LeoML document to a column of widgets.
  ///
  /// The [parsedLeoMLDocument] parameter is the parsed LeoML document as a list.
  /// Returns a column of widgets representing the parsed LeoML document.
  Column parseToColumn({required List parsedLeoMLDocument});

  /// Parses the LeoML document to a set of widgets.
  ///
  /// The [parsedLeoMLDocument] parameter is the parsed LeoML document as a list.
  /// Returns a set of widgets representing the parsed LeoML document.
  Set<Widget> parseToSet({required List parsedLeoMLDocument});
}

