// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.0
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083502
// 04.07.2023 08:35
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/image_url_is_missing_exception.dart';
import 'package:leoml_parser/src/exception/list_does_not_contains_enough_elements_exception.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';
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
    this.headlineBuilder,
    this.subHeadlineBuilder,
    this.sectionBuilder,
    this.listBuilder,
    this.citationBuilder,
    this.imageBuilder,
  });

  /// The type of the content template.
  final String type;

  /// The factory used to build default widgets based on a key-value mapping.
  final WidgetFactory defaultWidgetFactory;

  /// The custom headline widget builder for the content template.
  final LeoMLWidgetBuilder? headlineBuilder;

  /// The custom subHeadline widget builder for the content template.
  final LeoMLWidgetBuilder? subHeadlineBuilder;

  /// The custom section widget builder for the content template.
  final LeoMLWidgetBuilder? sectionBuilder;

  /// The custom list widget builder for the content template.
  final LeoMLWidgetBuilder? listBuilder;

  /// The custom citation widget builder for the content template.
  final LeoMLWidgetBuilder? citationBuilder;

  /// The custom image widget builder for the content template.
  final LeoMLWidgetBuilder? imageBuilder;

  /// Parses the LeoML document into a column of widgets.
  ///
  /// The [parsedLeoMLDocument] parameter is a List containing the parsed LeoML document.
  /// It processes each element in the document and creates corresponding widgets.
  ///
  /// Returns a Column widget that contains the parsed LeoML document as a list of widgets.
  Column parseToColumn({required List parsedLeoMLDocument}) {
    // Ensure the structure of the parsed LeoML document is valid.
    assertLeoMLStructure(parsedLeoMLDocument);

    final columnContent = <Widget>[];

    for (Map<String, dynamic> map in parsedLeoMLDocument) {
      Widget widget = const Placeholder();

      // Check if a custom widget builder is available for the current key.
      // If available, use it to build the widget; otherwise, use the default widget factory.
      widget = _createWidget(widget, map);

      // Add padding to the widget and add it to the column content.
      columnContent.add(
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: widget,
        ),
      );
    }

    // Create a Column widget that stretches its children horizontally and return it.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnContent,
    );
  }

  /// Parses the LeoML document into a set of widgets.
  ///
  /// The [parsedLeoMLDocument] parameter is a List containing the parsed LeoML document.
  /// It processes each element in the document and creates corresponding widgets.
  ///
  /// Returns a Set of widgets representing the parsed LeoML document.
  Set<Widget> parseToSet({required List parsedLeoMLDocument}) {
    // Ensure the structure of the parsed LeoML document is valid.
    assertLeoMLStructure(parsedLeoMLDocument);

    final widgetSet = <Widget>{};

    for (Map<String, dynamic> map in parsedLeoMLDocument) {
      Widget widget = const Placeholder();

      // Check if a custom widget builder is available for the current key.
      // If available, use it to build the widget; otherwise, use the default widget factory.
      widget = _createWidget(widget, map);

      // Add the widget to the set.
      widgetSet.add(widget);
    }

    // Return the set of widgets.
    return widgetSet;
  }

  /// Builds a general custom widget based on the provided [key] and [object].
  ///
  /// This method is used to create custom widgets for specific keys when there is
  /// no dedicated builder available for that key. It checks the [key] and the
  /// availability of custom builders for certain widget types and creates the
  /// corresponding widget based on the provided [object] data.
  ///
  /// - If [key] is 'headline' and a [headlineBuilder] is available, it creates
  ///   a custom [Headline] widget.
  /// - If [key] is 'subHeadline' and a [subHeadlineBuilder] is available, it creates
  ///   a custom [SubHeadline] widget.
  /// - If [key] is 'section' and a [sectionBuilder] is available, it creates
  ///   a custom [Section] widget.
  /// - If [key] is 'list' and a [listBuilder] is available, it creates
  ///   a custom [List] widget.
  /// - If [key] is 'citation' and a [citationBuilder] is available, it creates
  ///   a custom [Citation] widget.
  /// - If [key] is 'image' and an [imageBuilder] is available, it creates
  ///   a custom [Image] widget.
  ///
  /// If none of the conditions match, it returns a [Placeholder] widget as a default.
  ///
  /// The [key] parameter specifies the type of widget to create.
  /// The [object] parameter contains the properties or data needed to configure the widget.
  ///
  /// Returns the created custom widget or a [Placeholder] if no matching conditions are met.
  Widget buildGeneralCustomWidget({required key, required Map<String, dynamic> object}) {
    if (key == 'headline' && headlineBuilder != null) {
      return headlineBuilder?.build(object: object) ?? const Placeholder();
    }
    if (key == 'subHeadline' && subHeadlineBuilder != null) {
      return subHeadlineBuilder?.build(object: object) ?? const Placeholder();
    }

    if (key == 'section' && sectionBuilder != null) {
      return sectionBuilder?.build(object: object) ?? const Placeholder();
    }

    if (key == 'list' && listBuilder != null) {
      return listBuilder?.build(object: object) ?? const Placeholder();
    }

    if (key == 'citation' && citationBuilder != null) {
      return citationBuilder?.build(object: object) ?? const Placeholder();
    }

    if (key == 'image' && imageBuilder != null) {
      return imageBuilder?.build(object: object) ?? const Placeholder();
    }

    return const Placeholder();
  }

  /// Checks if the list object contains at least two elements.
  ///
  /// The [object] parameter is the map representing the current object.
  /// Throws a [ListDoesNotContainsEnoughElementsException] if the list has less than two elements.
  void listContainsAtLeastTwoElements(Map<dynamic, dynamic> object) {
    if (object.keys.toList().first == 'list' &&
        (object['list'] as List).length < 2) {
      throw ListDoesNotContainsEnoughElementsException();
    }
  }

  /// Checks if the image object has the required 'imageURL' key.
  ///
  /// The [object] parameter is the map representing the current object.
  /// Throws an [ImageURLIsMissingException] if the 'imageURL' key is missing.
  void imageHasImageURL(Map<dynamic, dynamic> object) {
    if (object.keys.toList().first == 'image' &&
        !((object['image'] as Map).containsKey('imageURL'))) {
      throw ImageURLIsMissingException();
    }
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
  Widget buildCustomWidget({required String key, required Map<String, dynamic> object});

  Widget _createWidget(Widget widget, Map<String, dynamic> map) {
    // Check if a custom widget builder is available for the current key.
    // If available, use it to build the widget; otherwise, use the default widget factory.
    widget = hasCustomWidget(
      key: map.keys.first,
    )
        ? buildCustomWidget(key: map.keys.first, object: map)
        : defaultWidgetFactory.buildDefaultWidget(
            key: map.keys.first,
            object: map,
          );

    return widget;
  }
}
