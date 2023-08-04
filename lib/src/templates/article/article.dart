// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083445
// 04.07.2023 08:34
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/article_second_object_is_not_sub_headline_exception.dart';
import 'package:leoml_parser/src/exception/article_does_not_contains_section_exception.dart';
import 'package:leoml_parser/src/exception/article_first_object_is_not_headline_exception.dart';
import 'package:leoml_parser/src/exception/image_url_is_missing_exception.dart';
import 'package:leoml_parser/src/exception/list_does_not_contains_enough_elements_exception.dart';
import 'package:leoml_parser/src/templates/content_template.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';
import 'package:leoml_parser/src/widget_builder/widget_factory.dart';

class Article extends ContentTemplate {
  Article({
    WidgetFactory defaultWidgetFactory =
        const LeoMLParserDefaultWidgetFactory(),
    this.headlineBuilder,
    this.subHeadlineBuilder,
    this.sectionHeadlineBuilder,
    this.sectionBuilder,
    this.catchLineBuilder,
    this.imageBuilder,
    this.listBuilder,
    this.citationBuilder,
  }) : super(
          type: 'article',
          defaultWidgetFactory: defaultWidgetFactory,
        );

  /// The custom headline widget builder for the article template.
  final LeoMLWidgetBuilder? headlineBuilder;

  /// The custom subHeadline widget builder for the article template.
  final LeoMLWidgetBuilder? subHeadlineBuilder;

  /// The custom sectionHeadline widget builder for the article template.
  final LeoMLWidgetBuilder? sectionHeadlineBuilder;

  /// The custom section widget builder for the article template.
  final LeoMLWidgetBuilder? sectionBuilder;

  /// The custom catch line widget builder for the article template.
  final LeoMLWidgetBuilder? catchLineBuilder;

  /// The custom list widget builder for the article template.
  final LeoMLWidgetBuilder? listBuilder;

  /// The custom citation widget builder for the article template.
  final LeoMLWidgetBuilder? citationBuilder;

  /// The custom image widget builder for the article template.
  final LeoMLWidgetBuilder? imageBuilder;


  @override
  Widget buildCustomWidget({required String key, required Map object}) {
    if (key == 'headline' && headlineBuilder != null) {
      return headlineBuilder?.build(object: object) ?? const Placeholder();
    }

    if (key == 'sectionHeadline' && sectionHeadlineBuilder != null) {
      return sectionHeadlineBuilder?.build(object: object) ?? const Placeholder();
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

    if (key == 'catchLine' && catchLineBuilder != null) {
      return catchLineBuilder?.build(object: object) ?? const Placeholder();
    }

    return const Placeholder();
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

      _listContainsAtLeastTwoElements(object);

      _imageHasImageURL(object);
    }

    if (!hasSection) {
      throw ArticleDoesNotContainsSectionException();
    }

    return true;
  }

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

  /// Checks if the list object contains at least two elements.
  ///
  /// The [object] parameter is the map representing the current object.
  /// Throws a [ListDoesNotContainsEnoughElementsException] if the list has less than two elements.
  void _listContainsAtLeastTwoElements(Map<dynamic, dynamic> object) {
    if (object.keys.toList().first == 'list' &&
        (object['list'] as List).length < 2) {
      throw ListDoesNotContainsEnoughElementsException();
    }
  }

  /// Checks if the image object has the required 'imageURL' key.
  ///
  /// The [object] parameter is the map representing the current object.
  /// Throws an [ImageURLIsMissingException] if the 'imageURL' key is missing.
  void _imageHasImageURL(Map<dynamic, dynamic> object) {
    if (object.keys.toList().first == 'image' &&
        !((object['image'] as Map).containsKey('imageURL'))) {
      throw ImageURLIsMissingException();
    }
  }
}
