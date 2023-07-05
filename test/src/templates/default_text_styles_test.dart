// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230705134906
// 05.07.2023 13:49
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';

void main() {
  group('check if default values are not changed', () {
    test('h1TextStyle default values are unchanged', () {
      // given
      const expectedFontSize = 44.0;
      const expectedColor = Color(0xFF000000);
      const expectedFontWeight = FontWeight.normal;
      const expectedHeight = 1.667;

      // when
      final actualFontSize = h1TextStyle().fontSize;
      final actualColor = h1TextStyle().color;
      final actualFontWeight = h1TextStyle().fontWeight;
      final actualHeight = h1TextStyle().height;

      // then
      expect(actualFontSize, equals(expectedFontSize));
      expect(actualColor, equals(expectedColor));
      expect(actualFontWeight, equals(expectedFontWeight));
      expect(actualHeight, equals(expectedHeight));
    });
    test('h2TextStyle default values are unchanged', () {
      // given
      const expectedFontSize = 36.0;
      const expectedColor = Color(0xFF000000);
      const expectedFontWeight = FontWeight.normal;
      const expectedHeight = 1.417;

      // when
      final actualFontSize = h2TextStyle().fontSize;
      final actualColor = h2TextStyle().color;
      final actualFontWeight = h2TextStyle().fontWeight;
      final actualHeight = h2TextStyle().height;

      // then
      expect(actualFontSize, equals(expectedFontSize));
      expect(actualColor, equals(expectedColor));
      expect(actualFontWeight, equals(expectedFontWeight));
      expect(actualHeight, equals(expectedHeight));
    });
    test('h3TextStyle default values are unchanged', () {
      // given
      const expectedFontSize = 28.0;
      const expectedColor = Color(0xFF000000);
      const expectedFontWeight = FontWeight.normal;
      const expectedHeight = 1.417;

      // when
      final actualFontSize = h3TextStyle().fontSize;
      final actualColor = h3TextStyle().color;
      final actualFontWeight = h3TextStyle().fontWeight;
      final actualHeight = h3TextStyle().height;

      // then
      expect(actualFontSize, equals(expectedFontSize));
      expect(actualColor, equals(expectedColor));
      expect(actualFontWeight, equals(expectedFontWeight));
      expect(actualHeight, equals(expectedHeight));
    });
    test('h4TextStyle default values are unchanged', () {
      // given
      const expectedFontSize = 22.0;
      const expectedColor = Color(0xFF000000);
      const expectedFontWeight = FontWeight.normal;
      const expectedHeight = 1.273;

      // when
      final actualFontSize = h4TextStyle().fontSize;
      final actualColor = h4TextStyle().color;
      final actualFontWeight = h4TextStyle().fontWeight;
      final actualHeight = h4TextStyle().height;

      // then
      expect(actualFontSize, equals(expectedFontSize));
      expect(actualColor, equals(expectedColor));
      expect(actualFontWeight, equals(expectedFontWeight));
      expect(actualHeight, equals(expectedHeight));
    });
    test('bodyTextStyle default values are unchanged', () {
      // given
      const expectedFontSize = 18.0;
      const expectedColor = Color(0xFF000000);
      const expectedFontWeight = FontWeight.normal;
      const expectedFontStyle = FontStyle.normal;
      const expectedHeight = 1.5;

      // when
      final actualFontSize = bodyTextStyle().fontSize;
      final actualColor = bodyTextStyle().color;
      final actualFontWeight = bodyTextStyle().fontWeight;
      final actualFontStyle = bodyTextStyle().fontStyle;
      final actualHeight = bodyTextStyle().height;

      // then
      expect(actualFontSize, equals(expectedFontSize));
      expect(actualColor, equals(expectedColor));
      expect(actualFontWeight, equals(expectedFontWeight));
      expect(actualFontStyle, equals(expectedFontStyle));
      expect(actualHeight, equals(expectedHeight));
    });
    test('smallTextStyle default values are unchanged', () {
      // given
      const expectedFontSize = 15.0;
      const expectedColor = Color(0xFF000000);
      const expectedFontWeight = FontWeight.normal;
      const expectedFontStyle = FontStyle.normal;
      const expectedHeight = 1.5;
      const expectedLetterSpacing = -0.2;

      // when
      final actualFontSize = smallTextStyle().fontSize;
      final actualColor = smallTextStyle().color;
      final actualFontWeight = smallTextStyle().fontWeight;
      final actualFontStyle = smallTextStyle().fontStyle;
      final actualHeight = smallTextStyle().height;
      final actualLetterSpacing = smallTextStyle().letterSpacing;

      // then
      expect(actualFontSize, equals(expectedFontSize));
      expect(actualColor, equals(expectedColor));
      expect(actualFontWeight, equals(expectedFontWeight));
      expect(actualFontStyle, equals(expectedFontStyle));
      expect(actualHeight, equals(expectedHeight));
      expect(actualLetterSpacing, equals(expectedLetterSpacing));
    });
    test('verySmallTextStyle default values are unchanged', () {
      // given
      const expectedFontSize = 12.0;
      const expectedColor = Color(0xFF000000);
      const expectedFontWeight = FontWeight.normal;
      const expectedFontStyle = FontStyle.normal;
      const expectedHeight = 1.5;

      // when
      final actualFontSize = verySmallTextStyle().fontSize;
      final actualColor = verySmallTextStyle().color;
      final actualFontWeight = verySmallTextStyle().fontWeight;
      final actualFontStyle = verySmallTextStyle().fontStyle;
      final actualHeight = verySmallTextStyle().height;

      // then
      expect(actualFontSize, equals(expectedFontSize));
      expect(actualColor, equals(expectedColor));
      expect(actualFontWeight, equals(expectedFontWeight));
      expect(actualFontStyle, equals(expectedFontStyle));
      expect(actualHeight, equals(expectedHeight));
    });
    test('extraSmallTextStyle default values are unchanged', () {
      // given
      const expectedFontSize = 10.0;
      const expectedColor = Color(0xFF000000);
      const expectedFontWeight = FontWeight.normal;
      const expectedFontStyle = FontStyle.normal;
      const expectedHeight = 1.5;

      // when
      final actualFontSize = extraSmallTextStyle().fontSize;
      final actualColor = extraSmallTextStyle().color;
      final actualFontWeight = extraSmallTextStyle().fontWeight;
      final actualFontStyle = extraSmallTextStyle().fontStyle;
      final actualHeight = extraSmallTextStyle().height;

      // then
      expect(actualFontSize, equals(expectedFontSize));
      expect(actualColor, equals(expectedColor));
      expect(actualFontWeight, equals(expectedFontWeight));
      expect(actualFontStyle, equals(expectedFontStyle));
      expect(actualHeight, equals(expectedHeight));
    });
  });
}
