// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704152328
// 04.07.2023 15:23
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/widget_map_does_not_contains_requested_key_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/widget_builder/default_widgets_builder.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';

/// A factory class for creating widgets based on a key-value mapping.
abstract class WidgetFactory {
  const WidgetFactory();

  static final _defaultWidgetsMap = <String, LeoMLWidgetBuilder>{
    headline: HeadlineBuilder(),
    subHeadline: SubHeadlineBuilder(),
    sectionHeadline: SectionHeadlineBuilder(),
    paragraphHeadline : ParagraphHeadlineBuilder(),
    section: SectionBuilder(),
    paragraph: ParagraphBuilder(),
    citation: CitationBuilder(),
    list: ListBuilder(),
    image: ImageBuilder(),
    opening: OpeningBuilder(),
    catchLine: CatchLineBuilder(),
    header: HeaderBuilder(),
    content: ContentBuilder(),
  };

  /// Retrieves the default widget associated with the given [key].
  LeoMLWidgetBuilder? getDefaultWidget(String key) {
    return _defaultWidgetsMap[key];
  }

  /// Checks if the [key] is present in the default widget map.
  ///
  /// Returns true if the [key] exists in the widget map, false otherwise.
  bool defaultWidgetMapContainsKey({required String key}) =>
      _defaultWidgetsMap.containsKey(key);

  /// Builds a default widget based on the provided [key] and [object].
  ///
  /// The [key] represents the type of widget to create.
  /// The [object] contains the properties or data needed to configure the widget.
  ///
  /// Returns the created widget, or a [Placeholder] if the key is not found.
  Widget buildDefaultWidget({
    required String key,
    required Map<String, dynamic> object,
  });
}

/// A custom widget factory that extends the [WidgetFactory] class.
///
/// This factory overrides the [buildDefaultWidget] method to create widgets
/// using the associated widget mapping.
class LeoMLParserDefaultWidgetFactory extends WidgetFactory {
  const LeoMLParserDefaultWidgetFactory();
  @override
  Widget buildDefaultWidget({
    required String key,
    required Map<String, dynamic> object,
  }) {
    _checkIifWidgetMapContainsRequestedKey(key);

    final defaultWidget = getDefaultWidget(key);

    return defaultWidget?.build(object: object) ?? const Placeholder();
  }

  void _checkIifWidgetMapContainsRequestedKey(String key) {
    if (!defaultWidgetMapContainsKey(key: key)) {
      throw WidgetMapDoesNotContainsRequestedKeyException(
        requestedTagName: key,
      );
    }
  }
}
