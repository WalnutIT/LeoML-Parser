// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083445
// 04.07.2023 08:34
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/article_does_not_contains_section_exception.dart';
import 'package:leoml_parser/src/exception/article_first_object_is_not_headline_exception.dart';
import 'package:leoml_parser/src/exception/article_second_object_is_not_sub_headline_exception.dart';
import 'package:leoml_parser/src/templates/content_template.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';
import 'package:leoml_parser/src/widget_builder/widget_factory.dart';

class Article extends ContentTemplate {
  Article({
    WidgetFactory defaultWidgetFactory =
        const LeoMLParserDefaultWidgetFactory(),
    this.sectionHeadlineBuilder,
    this.catchLineBuilder,
    super.headlineBuilder,
    super.subHeadlineBuilder,
    super.sectionBuilder,
    super.imageBuilder,
    super.listBuilder,
    super.citationBuilder,
  }) : super(
          type: 'article',
          defaultWidgetFactory: defaultWidgetFactory,
        );

  /// The custom sectionHeadline widget builder for the article template.
  final LeoMLWidgetBuilder? sectionHeadlineBuilder;

  /// The custom catch line widget builder for the article template.
  final LeoMLWidgetBuilder? catchLineBuilder;

  @override
  Widget buildCustomWidget({required String key, required Map<String, dynamic> object}) {
    if (key == 'sectionHeadline' && sectionHeadlineBuilder != null) {
      return sectionHeadlineBuilder?.build(object: object) ??
          const Placeholder();
    }

    if (key == 'catchLine' && catchLineBuilder != null) {
      return catchLineBuilder?.build(object: object) ?? const Placeholder();
    }

    return buildGeneralCustomWidget(key: key, object: object);
  }

  @override
  bool hasCustomWidget({required String key}) {
    switch (key) {
      case 'headline':
        return headlineBuilder != null;
      case 'subHeadline':
        return subHeadlineBuilder != null;
      case 'sectionHeadline':
        return sectionHeadlineBuilder != null;
      case 'section':
        return sectionBuilder != null;
      case 'list':
        return listBuilder != null;
      case 'citation':
        return citationBuilder != null;
      case 'image':
        return imageBuilder != null;
      case 'catchLine':
        return catchLineBuilder != null;
      default:
        return false;
    }
  }

  //jscpd:ignore-start
  @override
  bool assertLeoMLStructure(List parsedLeoMLDocument) {
    bool hasSubHeadline = false;
    bool hasSection = false;

    for (var index = 0; index < parsedLeoMLDocument.length; index++) {
      final object = parsedLeoMLDocument[index] as Map;

      _checkIfFirstObjectIsHeadline(index, object);

      hasSubHeadline = _containsSubHeadline(hasSubHeadline, object);

      if (hasSubHeadline) {
        _checkIfSubHeadlineFollowsTheHeadline(index, object);
      }

      hasSection = _containsAtLeastOneSection(hasSection, object);

      listContainsAtLeastTwoElements(object);

      imageHasImageURL(object);
    }

    if (!hasSection) {
      throw ArticleDoesNotContainsSectionException();
    }

    return true;
  }

  // jscpd:ignore-end

  /// Checks if the provided object contains a subheadline.
  ///
  /// The [hasSubHeadline] parameter represents whether a subheadline has already been found.
  /// The [object] parameter is a LeoML object from which the check is performed.
  ///
  /// Returns `true` if the object contains a subheadline, otherwise returns `false`.
  bool _containsSubHeadline(
    bool hasSubHeadline,
    Map<dynamic, dynamic> object,
  ) {
    if (!hasSubHeadline && object.keys.toList().first == 'subHeadline') {
      hasSubHeadline = true;
    }

    return hasSubHeadline;
  }

  /// Checks if the second object in the provided index is a subheadline.
  ///
  /// The [index] parameter represents the index of the object to check.
  /// The [object] parameter is a LeoML object from which the check is performed.
  ///
  /// Throws an `ArticleSecondObjectIsNotSubHeadlineException` if the second object is not a subheadline.
  void _checkIfSubHeadlineFollowsTheHeadline(
    int index,
    Map<dynamic, dynamic> object,
  ) {
    if (index != 1 && object.keys.toList().first == 'subHeadline') {
      throw ArticleSecondObjectIsNotSubHeadlineException();
    }
  }

  /// Checks if the provided object contains at least one section.
  ///
  /// The [hasSection] parameter represents whether a section has already been found.
  /// The [object] parameter is a LeoML object from which the check is performed.
  ///
  /// Returns `true` if the object contains a section, otherwise returns `false`.
  bool _containsAtLeastOneSection(
    bool hasSection,
    Map<dynamic, dynamic> object,
  ) {
    if (!hasSection && object.keys.toList().first == 'section') {
      hasSection = true;
    }

    return hasSection;
  }

  /// Checks if the first object in the list is a 'headline' object.
  ///
  /// The [index] parameter indicates the index of the current object.
  /// The [object] parameter is the map representing the current object.
  /// Throws a [BlogFirstObjectIsNotHeadlineException] if the first object is not a 'headline' object.
  void _checkIfFirstObjectIsHeadline(int index, Map<dynamic, dynamic> object) {
    if (index == 0 && object.keys.first != 'headline') {
      throw ArticleFirstObjectIsNotHeadlineException();
    }
  }
}
