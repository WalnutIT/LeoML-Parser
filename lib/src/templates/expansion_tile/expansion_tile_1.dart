// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013100811
// 13.10.2023 10:08
import 'package:flutter/material.dart';
import 'package:leoml_parser/src/exception/list_is_empty_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/content_template.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';
import 'package:leoml_parser/src/widget_builder/widget_factory.dart';

/// A custom implementation of an expansion tile for LeoML content.
///
/// The `ExpansionTile1` class extends [ContentTemplate] and provides support
/// for rendering various LeoML elements within an expansion tile. It allows
/// customization of the rendering behavior for specific elements like headers,
/// text, and list items through builders.
///
/// Usage:
///
/// ```dart
/// ExpansionTile1(
///   h1Builder: (object) => MyHeaderWidget(object: object),
///   txBuilder: (object) => MyTextWidget(object: object),
///   liBuilder: (object) => MyListItemWidget(object: object),
/// )
/// ```
class ExpansionTile1 extends ContentTemplate {
  /// Creates an `ExpansionTile1` instance.
  ///
  /// The [defaultWidgetFactory] parameter allows you to specify a custom widget
  /// factory to use when creating widgets. The [h1Builder], [h2Builder],
  /// [h3Builder], [h4Builder], [txBuilder], and [liBuilder] parameters are
  /// optional builders for specific LeoML elements.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// ExpansionTile1(
  ///   h1Builder: (object) => MyHeaderWidget(object: object),
  ///   txBuilder: (object) => MyTextWidget(object: object),
  ///   liBuilder: (object) => MyListItemWidget(object: object),
  /// )
  /// ```
  ExpansionTile1({
    WidgetFactory defaultWidgetFactory =
        const LeoMLParserDefaultWidgetFactory(),
    this.h1Builder,
    this.h2Builder,
    this.h3Builder,
    this.h4Builder,
    this.txBuilder,
    this.liBuilder,
  }) : super(
          type: 'expansion_tile_1',
          defaultWidgetFactory: defaultWidgetFactory,
        );

  /// A builder for rendering LeoML `h1` elements.
  final LeoMLWidgetBuilder? h1Builder;

  /// A builder for rendering LeoML `h2` elements.
  final LeoMLWidgetBuilder? h2Builder;

  /// A builder for rendering LeoML `h3` elements.
  final LeoMLWidgetBuilder? h3Builder;

  /// A builder for rendering LeoML `h4` elements.
  final LeoMLWidgetBuilder? h4Builder;

  /// A builder for rendering LeoML `tx` (text) elements.
  final LeoMLWidgetBuilder? txBuilder;

  /// A builder for rendering LeoML `li` (list item) elements.
  final LeoMLWidgetBuilder? liBuilder;

  @override
  bool assertLeoMLStructure(List parsedLeoMLDocument) {
    for (var index = 0; index < parsedLeoMLDocument.length; index++) {
      final object = parsedLeoMLDocument[index] as Map<String, dynamic>;
      _listIsNotEmpty(object);
    }

    return true;
  }

  @override
  Widget buildCustomWidget({required String key, required Map<String, dynamic> object}) {
    // Implement logic to build custom widgets based on the provided key.
    // You can use the specified builders for customization.
    // If no custom builder is provided for a key, return a Placeholder widget.

    if (key == h1 && h1Builder != null) {
      return h1Builder?.build(object: object) ?? const Placeholder();
    }

    if (key == h2 && h2Builder != null) {
      return h2Builder?.build(object: object) ?? const Placeholder();
    }

    if (key == h3 && h3Builder != null) {
      return h3Builder?.build(object: object) ?? const Placeholder();
    }

    if (key == h4 && h4Builder != null) {
      return h4Builder?.build(object: object) ?? const Placeholder();
    }

    if (key == tx && txBuilder != null) {
      return txBuilder?.build(object: object) ?? const Placeholder();
    }

    if (key == li && liBuilder != null) {
      return liBuilder?.build(object: object) ?? const Placeholder();
    }

    // If the key doesn't match any custom builders, use a general custom widget builder.
    return buildGeneralCustomWidget(key: key, object: object);
  }

  @override
  bool hasCustomWidget({required String key}) {
    // Check if a custom builder is available for the specified key.
    // Return true if a custom builder exists, false otherwise.
    switch (key) {
      case h1:
        return h1Builder != null;
      case h2:
        return h2Builder != null;
      case h3:
        return h3Builder != null;
      case h4:
        return h4Builder != null;
      case tx:
        return txBuilder != null;
      case li:
        return liBuilder != null;
      default:
        return false;
    }
  }

  void _listIsNotEmpty(Map<dynamic, dynamic> object) {
    if (object.keys.toList().first == li && (object[li] as List).isEmpty) {
      throw ListIsEmptyException();
    }
  }
}
