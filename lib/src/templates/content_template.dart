// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.0
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083502
// 04.07.2023 08:35
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/widget_factory.dart';
/// An abstract class representing a content template.
abstract class ContentTemplate {
  /// Creates a `ContentTemplate` instance.
  ///
  /// The [type] parameter specifies the type of the content template.
  /// The [widgetFactory] parameter is the factory used to create widgets based on a key-value mapping.
  ContentTemplate({
    required this.type,
    required this.widgetFactory,
  });

  /// The type of the content template.
  final String type;

  /// The factory used to create widgets based on a key-value mapping.
  final WidgetFactory widgetFactory;

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
          ? createCustomWidget(key: map.keys.first, object: map)
          : widgetFactory.createWidget(key: map.keys.first, object: map);

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
      final widget = widgetFactory.createWidget(
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

  /// Creates a custom widget based on the provided [key] and [object].
  ///
  /// The [key] represents the type of custom widget to create.
  /// The [object] contains the properties or data needed to configure the custom widget.
  ///
  /// Returns the created custom widget, or a default fallback widget if the [key] is not found.
  Widget createCustomWidget({required String key, required Map object});
}
