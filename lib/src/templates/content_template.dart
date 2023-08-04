// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.0
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083502
// 04.07.2023 08:35
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/widget_builder/widget_factory.dart';
/// An abstract class representing a content template.
abstract class ContentTemplate {
  /// Creates a `ContentTemplate` instance.
  ///
  /// The [type] parameter specifies the type of the content template.
  /// The [defaultWidgetFactory] parameter is the factory used to create widgets based on a key-value mapping.
  ContentTemplate({
    required this.type,
    required this.defaultWidgetFactory,
  });

  /// The type of the content template.
  final String type;

  /// The factory used to build default widgets based on a key-value mapping.
  final WidgetFactory defaultWidgetFactory;

  /// Parses the LeoML document to a column of widgets.
  ///
  /// The [parsedLeoMLDocument] parameter is the parsed LeoML document as a list.
  /// Returns a column of widgets representing the parsed LeoML document.
  Column parseToColumn({required List parsedLeoMLDocument}) {
    assertLeoMLStructure(parsedLeoMLDocument);

    final columnContent = <Widget>[];

    for (Map map in parsedLeoMLDocument) {
      Widget widget = const Placeholder();

      widget = hasCustomWidget(
        key: map.keys.first,
      )
          ? buildCustomWidget(key: map.keys.first, object: map)
          : defaultWidgetFactory.buildDefaultWidget(key: map.keys.first, object: map);

      columnContent.add(
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: widget,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnContent,
    );
  }

  /// Parses the LeoML document to a set of widgets.
  ///
  /// The [parsedLeoMLDocument] parameter is the parsed LeoML document as a list.
  /// Returns a set of widgets representing the parsed LeoML document.
  Set<Widget> parseToSet({required List parsedLeoMLDocument}) {
    assertLeoMLStructure(parsedLeoMLDocument);

    final widgetSet = <Widget>{};

    for (Map map in parsedLeoMLDocument) {
      final widget = defaultWidgetFactory.buildDefaultWidget(
        key: map.keys.first,
        object: map,
      );

      widgetSet.add(widget);
    }

    return widgetSet;
  }

  /// Asserts the LeoML document structure.
  ///
  /// The [parsedLeoMLDocument] parameter is the parsed LeoML document as a list.
  bool assertLeoMLStructure(List parsedLeoMLDocument);

  /// Checks if the content template has a custom widget associated with the given [key].
  ///
  /// The [key] represents the type of custom widget to check.
  ///
  /// Returns `true` if the content template has a custom widget associated with the [key],
  /// `false` otherwise.
  bool hasCustomWidget({
    required String key,
  });

  /// Builds a custom widget based on the provided [key] and [object].
  ///
  /// The [key] represents the type of custom widget to create.
  /// The [object] contains the properties or data needed to configure the custom widget.
  ///
  /// Returns the created custom widget, or a default fallback widget if the [key] is not found.
  Widget buildCustomWidget({required String key, required Map object});
}
