// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704085156
// 04.07.2023 08:51
import 'package:flutter/material.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget that represents the opening of a blog post in the blog template.
class Opening extends StatelessWidgetTemplate {
  /// Creates an [Opening] widget.
  ///
  /// The [text] parameter specifies the text to be displayed in the opening of the blog post.
  /// The [imageURL] parameter specifies the URL of an image to be displayed in the opening.
  const Opening({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              object['opening']['text'],
              style: h4TextStyle(),
            ),
          ),
          if (object['opening'].containsKey('imageURL'))
            Image.network(
              object['opening']['imageURL'],
              height: 300.0,
              fit: BoxFit.cover,
              // errorBuilder: getErrorLoadingBuilder,
              // frameBuilder: getImageLoadingBuilder,
            ),
        ],
      );

  @override
  void validateObject() {
    if (object['opening']['text'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'text',
      );
    }

    if (object['opening'].containsKey('imageURL') &&
        object['opening']['imageURL'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'imageURL',
      );
    }
  }
}
