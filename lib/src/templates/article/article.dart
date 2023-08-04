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
import 'package:leoml_parser/src/exception/image_url_is_missing_exception.dart';
import 'package:leoml_parser/src/exception/list_does_not_contains_enough_elements_exception.dart';
import 'package:leoml_parser/src/templates/content_template.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';
import 'package:leoml_parser/src/widget_builder/widget_factory.dart';

class Article extends ContentTemplate {
  Article({
    WidgetFactory defaultWidgetFactory =
        const LeoMLParserDefaultWidgetFactory(),
    this.headline,
    this.subHeadline,
    this.sectionHeadline,
    this.section,
    this.catchLine,
    this.image,
    this.list,
    this.citation,
  }) : super(
          type: 'article',
          defaultWidgetFactory: defaultWidgetFactory,
        );

  final LeoMLWidgetBuilder? headline;

  final LeoMLWidgetBuilder? subHeadline;

  final LeoMLWidgetBuilder? sectionHeadline;

  final LeoMLWidgetBuilder? section;

  final LeoMLWidgetBuilder? catchLine;

  final LeoMLWidgetBuilder? list;

  final LeoMLWidgetBuilder? citation;

  final LeoMLWidgetBuilder? image;

  @override
  Widget createCustomWidget({required String key, required Map object}) {
    if (key == 'headline' && headline != null) {
      return headline?.build(object: object) ?? const Placeholder();
    }

    if (key == 'sectionHeadline' && sectionHeadline != null) {
      return sectionHeadline?.build(object: object) ?? const Placeholder();
    }

    if (key == 'subHeadline' && subHeadline != null) {
      return subHeadline?.build(object: object) ?? const Placeholder();
    }

    if (key == 'section' && section != null) {
      return section?.build(object: object) ?? const Placeholder();
    }

    if (key == 'list' && list != null) {
      return list?.build(object: object) ?? const Placeholder();
    }

    if (key == 'citation' && citation != null) {
      return citation?.build(object: object) ?? const Placeholder();
    }

    if (key == 'image' && image != null) {
      return image?.build(object: object) ?? const Placeholder();
    }

    if (key == 'catchLine' && image != null) {
      return catchLine?.build(object: object) ?? const Placeholder();
    }

    return const Placeholder();
  }

  @override
  bool hasCustomWidget({required String key}) {
    switch (key) {
      case 'headline':
        return headline != null;
      case 'subHeadline':
        return subHeadline != null;
      case 'sectionHeadline':
        return sectionHeadline != null;
      case 'section':
        return section != null;
      case 'list':
        return list != null;
      case 'citation':
        return citation != null;
      case 'image':
        return image != null;
      case 'catchLine':
        return catchLine != null;
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

      hasSubHeadline = _hasSubHeadline();

      if (hasSubHeadline) {
        _checkIfSubHeadlineFollowsTheHeadline();
        _checkIfTheFontSizeOfTheSubHeadlineIsMoreLittle();
      }

      hasSection = _containsAtLeastOneSection();

      _listContainsAtLeastTwoElements(object);

      _imageHasImageURL(object);
    }

    if (!hasSection) {
      throw ArticleDoesNotContainsSectionException();
    }

    return true;
  }

  bool _hasSubHeadline() {
    return false;
  }

  void _checkIfSubHeadlineFollowsTheHeadline() {}

  void _checkIfTheFontSizeOfTheSubHeadlineIsMoreLittle() {}

  bool _containsAtLeastOneSection() {
    return false;
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
