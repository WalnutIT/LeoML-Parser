// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083437
// 04.07.2023 08:34
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/blog_does_not_contains_section_exception.dart';
import 'package:leoml_parser/src/exception/blog_does_not_contains_sub_headline_exception.dart';
import 'package:leoml_parser/src/exception/blog_first_object_is_not_headline_exception.dart';
import 'package:leoml_parser/src/exception/blog_opening_does_not_contains_text_tag_exception.dart';
import 'package:leoml_parser/src/exception/blog_second_object_is_not_opening_exception.dart';
import 'package:leoml_parser/src/exception/image_url_is_missing_exception.dart';
import 'package:leoml_parser/src/exception/list_does_not_contains_enough_elements_exception.dart';
import 'package:leoml_parser/src/templates/content_template.dart';
import 'package:leoml_parser/src/templates/default_widgets_creator.dart';
import 'package:leoml_parser/src/templates/widget_factory.dart';

/// Represents a blog content template.
class Blog extends ContentTemplate {
  /// Creates a new instance of the Blog content template.
  ///
  /// The [headline], [opening], [subHeadline], [section], [list],
  /// [citation], and [image] widgets can be provided to customize the
  /// appearance of the blog content.
  Blog({
    this.headline,
    this.opening,
    this.subHeadline,
    this.section,
    this.list,
    this.citation,
    this.image,
  }) : super(
          type: 'blog',
          widgetFactory: LeoMLParserWidgetFactory(),
        );

  /// The headline widget for the blog.
  final LeoMLWidget? headline;

  /// The opening widget for the blog.
  final LeoMLWidget? opening;

  /// The subheadline widget for the blog.
  final LeoMLWidget? subHeadline;

  /// The section widget for the blog.
  final LeoMLWidget? section;

  /// The list widget for the blog.
  final LeoMLWidget? list;

  /// The citation widget for the blog.
  final LeoMLWidget? citation;

  /// The image widget for the blog.
  final LeoMLWidget? image;

  @override
  Widget createCustomWidget({required key, required Map object}) {
    if (key == 'headline' && headline != null) {
      return headline?.create(object: object) ?? const Placeholder();
    }

    if (key == 'opening' && opening != null) {
      return opening?.create(object: object) ?? const Placeholder();
    }

    if (key == 'subHeadline' && subHeadline != null) {
      return subHeadline?.create(object: object) ?? const Placeholder();
    }

    if (key == 'section' && section != null) {
      return section?.create(object: object) ?? const Placeholder();
    }

    if (key == 'list' && list != null) {
      return list?.create(object: object) ?? const Placeholder();
    }

    if (key == 'citation' && citation != null) {
      return citation?.create(object: object) ?? const Placeholder();
    }

    if (key == 'image' && image != null) {
      return image?.create(object: object) ?? const Placeholder();
    }

    return const Placeholder();
  }

  @override
  bool hasCustomWidget({
    required String key,
  }) {
    if (key == 'headline') {
      return headline != null;
    }

    if (key == 'opening') {
      return opening != null;
    }

    if (key == 'subHeadline') {
      return subHeadline != null;
    }

    if (key == 'section') {
      return section != null;
    }

    if (key == 'list') {
      return list != null;
    }

    if (key == 'citation') {
      return citation != null;
    }

    if (key == 'image') {
      return image != null;
    }

    return false;
  }

  @override
  bool assertLeoMLStructure(List parsedLeoMLDocument) {
    bool hasSubHeadline = false;
    bool hasSection = false;

    for (var index = 0; index < parsedLeoMLDocument.length; index++) {
      final object = parsedLeoMLDocument[index] as Map;

      _checkIfFirstObjectIsHeadline(index, object);

      _checkIfSecondObjectIsOpening(index, object);

      _openingContainsTextTag(object);

      hasSubHeadline = _containsAtLeastOneSubHeadline(hasSubHeadline, object);

      hasSection = _containsAtLeastOneSection(hasSection, object);

      _listContainsAtLeastTwoElements(object);

      _imageHasImageURL(object);
    }

    if (!hasSubHeadline) {
      throw BlogDoesNotContainsSubHeadlineException();
    }

    if (!hasSection) {
      throw BlogDoesNotContainsSectionException();
    }

    return true;
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

  /// Checks if the current object contains at least one 'section' object.
  ///
  /// The [hasSection] parameter indicates whether a 'section' object has been found before.
  /// The [object] parameter is the map representing the current object.
  /// Returns true if the current object contains at least one 'section' object, otherwise returns [hasSection].
  bool _containsAtLeastOneSection(
    bool hasSection,
    Map<dynamic, dynamic> object,
  ) {
    if (!hasSection && object.keys.toList().first == 'section') {
      hasSection = true;
    }

    return hasSection;
  }

  /// Checks if the current object contains at least one 'subHeadline' object.
  ///
  /// The [hasSubHeadline] parameter indicates whether a 'subHeadline' object has been found before.
  /// The [object] parameter is the map representing the current object.
  /// Returns true if the current object contains at least one 'subHeadline' object, otherwise returns [hasSubHeadline].
  bool _containsAtLeastOneSubHeadline(
    bool hasSubHeadline,
    Map<dynamic, dynamic> object,
  ) {
    if (!hasSubHeadline && object.keys.toList().first == 'subHeadline') {
      hasSubHeadline = true;
    }

    return hasSubHeadline;
  }

  /// Checks if the 'opening' object contains the required 'text' key.
  ///
  /// The [object] parameter is the map representing the current object.
  /// Throws a [BlogOpeningDoesNotContainsTextTagException] if the 'text' key is missing.
  void _openingContainsTextTag(Map<dynamic, dynamic> object) {
    if (object.keys.toList().first == 'opening' &&
        !((object['opening'] as Map).containsKey('text'))) {
      throw BlogOpeningDoesNotContainsTextTagException();
    }
  }

  /// Checks if the second object in the list is an 'opening' object.
  ///
  /// The [index] parameter indicates the index of the current object.
  /// The [object] parameter is the map representing the current object.
  /// Throws a [BlogSecondObjectIsNotOpeningException] if the second object is not an 'opening' object.
  void _checkIfSecondObjectIsOpening(int index, Map<dynamic, dynamic> object) {
    if (index == 1 && object.keys.toList().first != 'opening') {
      throw BlogSecondObjectIsNotOpeningException();
    }
  }

  /// Checks if the first object in the list is a 'headline' object.
  ///
  /// The [index] parameter indicates the index of the current object.
  /// The [object] parameter is the map representing the current object.
  /// Throws a [BlogFirstObjectIsNotHeadlineException] if the first object is not a 'headline' object.
  void _checkIfFirstObjectIsHeadline(int index, Map<dynamic, dynamic> object) {
    if (index == 0 && object.keys.first != 'headline') {
      throw BlogFirstObjectIsNotHeadlineException();
    }
  }
}
