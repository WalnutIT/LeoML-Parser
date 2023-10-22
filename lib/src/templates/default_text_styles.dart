// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704090616
// 04.07.2023 09:06
import 'package:flutter/painting.dart';

/// The default text color.
const defaultTextColor = Color(0xFF000000);

/// The default font weight.
const defaultFontWeight = FontWeight.normal;

/// The default font style.
const defaultFontStyle = FontStyle.normal;

/// The default letter spacing.
///
/// Only for smallTextStyle()
const defaultLetterSpacingSmallTextStyle = -0.2;

/// Returns a text style for heading level 1 (h1).
TextStyle h1TextStyle() => const TextStyle(
      fontSize: 44.0,
      color: defaultTextColor,
      fontWeight: defaultFontWeight,
      height: 1.667,
    );

/// Returns a text style for heading level 2 (h2).
TextStyle h2TextStyle() => const TextStyle(
      fontSize: 36.0,
      color: defaultTextColor,
      fontWeight: defaultFontWeight,
      height: 1.417,
    );

/// Returns a text style for heading level 3 (h3).
TextStyle h3TextStyle() => const TextStyle(
      fontSize: 28.0,
      color: defaultTextColor,
      fontWeight: defaultFontWeight,
      height: 1.417,
    );

/// Returns a text style for heading level 4 (h4).
TextStyle h4TextStyle() => const TextStyle(
      fontSize: 22.0,
      color: defaultTextColor,
      fontWeight: defaultFontWeight,
      height: 1.273,
    );

/// Returns a text style for heading level 4 (h4).
TextStyle h5TextStyle() => const TextStyle(
      fontSize: 20.0,
      color: defaultTextColor,
      fontWeight: FontWeight.bold,
      height: 1.273,
    );

/// Returns a text style for body text.
TextStyle bodyTextStyle() => const TextStyle(
      fontSize: 18.0,
      color: defaultTextColor,
      fontWeight: defaultFontWeight,
      height: 1.5,
      fontStyle: defaultFontStyle,
    );

/// Returns a small text style.
TextStyle smallTextStyle() => const TextStyle(
      fontSize: 15.0,
      color: defaultTextColor,
      fontStyle: defaultFontStyle,
      fontWeight: defaultFontWeight,
      height: 1.5,
      letterSpacing: defaultLetterSpacingSmallTextStyle,
    );

/// Returns a very small text style.
TextStyle verySmallTextStyle() => const TextStyle(
      fontSize: 12.0,
      color: defaultTextColor,
      fontStyle: defaultFontStyle,
      fontWeight: defaultFontWeight,
      height: 1.5,
    );

/// Returns an extra small text style.
TextStyle extraSmallTextStyle() => const TextStyle(
      fontSize: 10.0,
      color: defaultTextColor,
      fontStyle: defaultFontStyle,
      fontWeight: defaultFontWeight,
      height: 1.5,
    );
