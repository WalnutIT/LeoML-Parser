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
import 'package:leoml_parser/src/templates/default_widgets_creator.dart';

/// A factory class for creating widgets based on a key-value mapping.
abstract class WidgetFactory {
  static final _widgetsMap = <String, LeoMLWidget>{
    'headline': HeadlineWidget(),
    'subHeadline': SubHeadlineWidget(),
    'sectionHeadline': SectionHeadlineWidget(),
    'section': SectionWidget(),
    'citation': CitationWidget(),
    'list': ListWidget(),
    'image': ImageWidget(),
    'opening': OpeningWidget(),
    'catchLine': CatchLineWidget(),
  };

  /// Retrieves the widget associated with the given [key].
  LeoMLWidget? getWidget(String key) {
    return _widgetsMap[key];
  }





  /// Checks if the [key] is present in the widget map.
  ///
  /// Returns true if the [key] exists in the widget map, false otherwise.
  bool widgetMapContainsKey({required String key}) =>
      _widgetsMap.containsKey(key);

  /// Creates a widget based on the provided [key] and [object].
  ///
  /// The [key] represents the type of widget to create.
  /// The [object] contains the properties or data needed to configure the widget.
  ///
  /// Returns the created widget, or a [Container] if the key is not found.
  Widget createWidget({
    required String key,
    required Map object,
  });
}

/// A custom widget factory that extends the [WidgetFactory] class.
///
/// This factory overrides the [createWidget] method to create widgets
/// using the associated widget mapping.
class LeoMLParserWidgetFactory extends WidgetFactory {
  @override
  Widget createWidget({
    required String key,
    required Map object,
  }) {
    _checkIifWidgetMapContainsRequestedKey(key);

    final widget = getWidget(key);

    return widget?.create(object: object) ?? Container();
  }

  void _checkIifWidgetMapContainsRequestedKey(String key) {
    if (!widgetMapContainsKey(key: key)) {
      throw WidgetMapDoesNotContainsRequestedKeyException(
        requestedTagName: key,
      );
    }
  }
}
