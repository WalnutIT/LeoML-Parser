// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013100811
// 13.10.2023 10:08
import 'package:flutter/material.dart';
import 'package:leoml_parser/src/exception/expansion_tile_1_contains_more_than_one_subheadline_exception.dart';
import 'package:leoml_parser/src/exception/expansion_tile_1_content_does_not_follows_header_exception.dart';
import 'package:leoml_parser/src/exception/expansion_tile_1_does_not_contains_section_exception.dart';
import 'package:leoml_parser/src/exception/list_is_empty_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/content_template.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';
import 'package:leoml_parser/src/widget_builder/widget_factory.dart';

class ExpansionTile1 extends ContentTemplate {
  ExpansionTile1({
    WidgetFactory defaultWidgetFactory =
        const LeoMLParserDefaultWidgetFactory(),
    this.headerBuilder,
    this.contentBuilder,
    this.paragraphHeadlineBuilder,
    this.paragraphBuilder,
    super.customExpansionTile,
    super.headlineBuilder,
    super.citationBuilder,
    super.imageBuilder,
    super.listBuilder,
    super.sectionBuilder,
    super.sectionHeadlineBuilder,
    super.subHeadlineBuilder,
  }) : super(
          type: expansionTile1,
          defaultWidgetFactory: defaultWidgetFactory,
        );

  final LeoMLWidgetBuilder? headerBuilder;
  final LeoMLWidgetBuilder? contentBuilder;
  final LeoMLWidgetBuilder? paragraphHeadlineBuilder;
  final LeoMLWidgetBuilder? paragraphBuilder;

  @override
  bool assertLeoMLStructure(List parsedLeoMLDocument) {
    // bool hasSection = false;
    // bool hasSubHeadline = false;
    // bool hasExactlyOneSubheadline = false;
    // bool contentFollowsHeader = false;
    // bool hasHeader = false;
    // bool hasContent = false;
    // var header = <String, dynamic>{};
    //
    // for (int index = 0; index < parsedLeoMLDocument.length; index++) {
    //   final object = parsedLeoMLDocument[index];
    //
    //   if (object is Map<String, dynamic>) {
    //     _listIsNotEmpty(object);
    //     hasSubHeadline = _containsSubHeadline(hasSubHeadline, object);
    //     if (hasSubHeadline) {
    //       hasExactlyOneSubheadline =
    //           _containsExactlyOneSubheadline(hasSubHeadline, object);
    //     }
    //
    //     hasSection = _containsAtLeastOneSection(hasSection, object);
    //     imageHasImageURL(object);
    //     hasHeader = _containsHeader(object);
    //     if (hasHeader && header.isEmpty) {
    //       header = object;
    //     }
    //     hasContent = _containsContent(object);
    //     if (hasHeader && hasContent) {
    //       contentFollowsHeader = _contentFollowsHeader(header, object);
    //     }
    //   } else {
    //     assertLeoMLStructure(parsedLeoMLDocument[index]);
    //   }
    // }
    //
    // if (!hasSection) {
    //   throw ExpansionTile1DoesNotContainsSectionException();
    // }
    //
    // if (hasSubHeadline && !hasExactlyOneSubheadline) {
    //   throw ExpansionTile1ContainsMoreThanOneSubheadlineException();
    // }
    //
    // if (contentFollowsHeader) {
    //   throw ExpansionTile1ContentDoesNotFollowsHeaderException();
    // }

    return true;
  }

  @override
  Widget buildCustomWidget({
    required String key,
    required Map<String, dynamic> object,
  }) {
    // Implement logic to build custom widgets based on the provided key.
    // You can use the specified builders for customization.
    // If no custom builder is provided for a key, return a Placeholder widget.

    if (key == header && headerBuilder != null) {
      return headerBuilder?.build(object: object) ?? const Placeholder();
    }

    if (key == content && contentBuilder != null) {
      return contentBuilder?.build(object: object) ?? const Placeholder();
    }

    if (key == paragraph && paragraphBuilder != null) {
      return paragraphBuilder?.build(object: object) ?? const Placeholder();
    }

    if (key == paragraphHeadline && paragraphHeadlineBuilder != null) {
      return paragraphHeadlineBuilder?.build(object: object) ??
          const Placeholder();
    }

    // If the key doesn't match any custom builders, use a general custom widget builder.
    return buildGeneralCustomWidget(key: key, object: object);
  }

  @override
  bool hasCustomWidget({required String key}) {
    // Check if a custom builder is available for the specified key.
    // Return true if a custom builder exists, false otherwise.
    switch (key) {
      case header:
        return headerBuilder != null;
      case subHeadline:
        return subHeadlineBuilder != null;
      case content:
        return contentBuilder != null;
      case headline:
        return headlineBuilder != null;
      case citation:
        return citationBuilder != null;
      case section:
        return sectionBuilder != null;
      case sectionHeadline:
        return sectionHeadlineBuilder != null;
      case paragraphHeadline:
        return paragraphHeadlineBuilder != null;
      case paragraph:
        return paragraphBuilder != null;
      case list:
        return listBuilder != null;
      case image:
        return imageBuilder != null;
      default:
        return false;
    }
  }

  void _listIsNotEmpty(Map<dynamic, dynamic> object) {
    if (object.keys.toList().first == list && (object[list] as List).isEmpty) {
      throw ListIsEmptyException();
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
    if (!hasSection && object.keys.toList().first == section) {
      hasSection = true;
    }

    return hasSection;
  }

  bool _containsSubHeadline(
    bool hasSubHeadline,
    Map<dynamic, dynamic> object,
  ) {
    if (!hasSubHeadline && object.keys.toList().first == subHeadline) {
      hasSubHeadline = true;
    }

    return hasSubHeadline;
  }

  bool _containsExactlyOneSubheadline(
    bool hasSubheadline,
    Map<dynamic, dynamic> object,
  ) {
    return hasSubheadline;
  }

  bool _containsHeader(
    Map<dynamic, dynamic> object,
  ) {
    if (object.containsKey(headerBuilder)) {
      return true;
    }

    return false;
  }

  bool _containsContent(
    Map<dynamic, dynamic> object,
  ) {
    if (object.containsKey(contentBuilder)) {
      return true;
    }

    return false;
  }

  bool _contentFollowsHeader(
    Map<dynamic, dynamic> object1,
    Map<dynamic, dynamic> object2,
  ) {
    if (object1.containsKey(headerBuilder) &&
        object2.containsKey(contentBuilder)) {
      return true;
    }

    return false;
  }
}
