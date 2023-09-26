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
import 'package:leoml_parser/src/templates/content_template.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';
import 'package:leoml_parser/src/widget_builder/widget_factory.dart';

/// Represents a blog content template.
class Blog extends ContentTemplate {
  /// Creates a new instance of the Blog content template.
  ///
  /// The [headlineBuilder], [openingBuilder], [subHeadlineBuilder], [sectionBuilder], [listBuilder],
  /// [citationBuilder], and [imageBuilder] widgets can be provided to customize the
  /// appearance of the blog content.
  Blog({
    WidgetFactory defaultWidgetFactory =
        const LeoMLParserDefaultWidgetFactory(),
    this.openingBuilder,
    super.headlineBuilder,
    super.subHeadlineBuilder,
    super.sectionBuilder,
    super.listBuilder,
    super.citationBuilder,
    super.imageBuilder,
  }) : super(
          type: 'blog',
          defaultWidgetFactory: defaultWidgetFactory,
        );

  /// The custom opening widget builder for the blog template.
  final LeoMLWidgetBuilder? openingBuilder;

  @override
  Widget buildCustomWidget({required key, required Map object}) {
    if (key == 'opening' && openingBuilder != null) {
      return openingBuilder?.build(object: object) ?? const Placeholder();
    }

    return buildGeneralCustomWidget(key: key, object: object);
  }

  @override
  bool hasCustomWidget({
    required String key,
  }) {
    switch (key) {
      case 'headline':
        return headlineBuilder != null;
      case 'subHeadline':
        return subHeadlineBuilder != null;
      case 'opening':
        return openingBuilder != null;
      case 'section':
        return sectionBuilder != null;
      case 'list':
        return listBuilder != null;
      case 'citation':
        return citationBuilder != null;
      case 'image':
        return imageBuilder != null;
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

      _checkIfSecondObjectIsOpening(index, object);

      _openingContainsTextTag(object);

      hasSubHeadline = _containsAtLeastOneSubHeadline(hasSubHeadline, object);

      hasSection = _containsAtLeastOneSection(hasSection, object);

      listContainsAtLeastTwoElements(object);

      imageHasImageURL(object);
    }

    if (!hasSubHeadline) {
      throw BlogDoesNotContainsSubHeadlineException();
    }

    if (!hasSection) {
      throw BlogDoesNotContainsSectionException();
    }

    return true;
  }

  // jscpd:ignore-end

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
