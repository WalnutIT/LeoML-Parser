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
  final Widget? headline;

  /// The opening widget for the blog.
  final Widget? opening;

  /// The subheadline widget for the blog.
  final Widget? subHeadline;

  /// The section widget for the blog.
  final Widget? section;

  /// The list widget for the blog.
  final Widget? list;

  /// The citation widget for the blog.
  final Widget? citation;

  /// The image widget for the blog.
  final Widget? image;

  @override
  bool assertLeoMLStructure(List parsedLeoMLDocument) {
    bool hasSubHeadline = false;
    bool hasSection = false;

    for (var index = 0; index < parsedLeoMLDocument.length; index++) {
      final object = parsedLeoMLDocument[index] as Map;

      // 1. first object is headline
      if (index == 0 && object.keys.first != 'headline') {
        throw BlogFirstObjectIsNotHeadlineException();
      }

      // 2. second object is opening
      if (index == 1 && object.keys.toList().first != 'opening') {
        throw BlogSecondObjectIsNotOpeningException();
      }

      // 3. if it is an opening, it contains the text
      if (object.keys.toList().first == 'opening' &&
          !((object['opening'] as Map).containsKey('text'))) {
        throw BlogOpeningDoesNotContainsTextTagException();
      }

      // 4. contains at least one sub headline
      if (!hasSubHeadline && object.keys.toList().first == 'subHeadline') {
        hasSubHeadline = true;
      }

      // 5. contains at least one section
      if (!hasSection && object.keys.toList().first == 'section') {
        hasSection = true;
      }
      // 6. if it contains a list, it has at least 2 elements
      if (object.keys.toList().first == 'list' &&
          (object['list'] as List).length < 2) {
        throw ListDoesNotContainsEnoughElementException();
      }

      // 7. if it contains an image, an image url is set
      if (object.keys.toList().first == 'image' &&
          !((object['image'] as Map).containsKey('imageUrl'))) {
        throw ImageURLIsMissingException();
      }
    }

    if (!hasSubHeadline) {
      throw BlogDoesNotContainsSubHeadlineException();
    }

    if (!hasSection) {
      throw BlogDoesNotContainsSectionException();
    }

    return true;
  }
}
