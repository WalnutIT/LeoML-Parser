// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704090616
// 04.07.2023 09:06
import 'package:flutter/painting.dart';

/// The default text color.
const defaultTextColor = Color(0xFF000000);

/// Returns a text style for heading level 1 (h1).
///
/// The [color] parameter specifies the text color.
/// The [fontWeight] parameter specifies the font weight.
TextStyle h1TextStyle({
  Color color = defaultTextColor,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: 44.0,
      color: color,
      fontWeight: fontWeight,
      height: 1.667,
    );

/// Returns a text style for heading level 2 (h2).
///
/// The [color] parameter specifies the text color.
/// The [fontWeight] parameter specifies the font weight.
TextStyle h2TextStyle({
  Color color = defaultTextColor,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: 36.0,
      color: color,
      fontWeight: fontWeight,
      height: 1.417,
    );

/// Returns a text style for heading level 3 (h3).
///
/// The [color] parameter specifies the text color.
/// The [fontWeight] parameter specifies the font weight.
TextStyle h3TextStyle({
  Color color = defaultTextColor,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: 28.0,
      color: color,
      fontWeight: fontWeight,
      height: 1.417,
    );

/// Returns a text style for heading level 4 (h4).
///
/// The [color] parameter specifies the text color.
/// The [fontWeight] parameter specifies the font weight.
TextStyle h4TextStyle({
  Color color = defaultTextColor,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: 22.0,
      color: color,
      fontWeight: fontWeight,
      height: 1.273,
    );

/// Returns a text style for body text.
///
/// The [color] parameter specifies the text color.
/// The [fontWeight] parameter specifies the font weight.
/// The [fontStyle] parameter specifies the font style.
TextStyle bodyTextStyle({
  Color color = defaultTextColor,
  FontWeight fontWeight = FontWeight.normal,
  FontStyle fontStyle = FontStyle.normal,
}) =>
    TextStyle(
      fontSize: 18.0,
      color: color,
      fontWeight: fontWeight,
      height: 1.5,
      fontStyle: fontStyle,
    );

/// Returns a small text style.
///
/// The [color] parameter specifies the text color.
/// The [fontStyle] parameter specifies the font style.
/// The [fontWeight] parameter specifies the font weight.
/// The [letterSpacing] parameter specifies the letter spacing.
TextStyle smallTextStyle({
  Color color = defaultTextColor,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.normal,
  double letterSpacing = -0.2,
}) =>
    TextStyle(
      fontSize: 15.0,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      height: 1.5,
      letterSpacing: letterSpacing,
    );

/// Returns a very small text style.
///
/// The [color] parameter specifies the text color.
/// The [fontStyle] parameter specifies the font style.
/// The [fontWeight] parameter specifies the font weight.
TextStyle verySmallTextStyle({
  Color color = defaultTextColor,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: 12.0,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      height: 1.5,
    );

/// Returns an extra small text style.
///
/// The [color] parameter specifies the text color.
/// The [fontStyle] parameter specifies the font style.
/// The [fontWeight] parameter specifies the font weight.
TextStyle extraSmallTextStyle({
  Color color = defaultTextColor,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: 10.0,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      height: 1.5,
    );
