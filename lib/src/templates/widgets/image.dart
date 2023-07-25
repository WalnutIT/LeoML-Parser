// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704091756
// 04.07.2023 09:17
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';
import 'package:leoml_parser/src/templates/widgets/image_builders/image_error_builder.dart';
import 'package:leoml_parser/src/templates/widgets/image_builders/image_loading_builder.dart';

/// A widget that represents an image with an optional description.
class LeoImage extends StatelessWidgetTemplate {
  /// Creates a [LeoImage] widget.
  ///
  /// The [imageURL] parameter specifies the URL of the image.
  /// The [imageDescription] parameter specifies the description of the image (optional).
  const LeoImage({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Image.network(
            object['image']['imageURL'],
            errorBuilder: getErrorLoadingBuilder,
            loadingBuilder: getImageLoadingBuilder,
          ),
          if (object['image'].containsKey('imageDescription'))
            Column(
              children: [
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  object['image']['imageDescription'],
                  style: smallTextStyle(),
                ),
              ],
            ),
        ],
      );

  @override
  void validateObject() {
    if (object['image']['imageURL'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'imageURL',
      );
    }

    if (object['image'].containsKey('imageDescription') &&
        object['image']['imageDescription'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'imageDescription',
      );
    }
  }
}
