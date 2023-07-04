// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704085156
// 04.07.2023 08:51
import 'package:flutter/material.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/widgets/image_builders/image_error_builder.dart';
import 'package:leoml_parser/src/templates/widgets/image_builders/image_loading_builder.dart'
as image_builders;

/// A widget that represents the opening of a blog post in the blog template.
class Opening extends StatelessWidget {
  /// Creates an [Opening] widget.
  ///
  /// The [text] parameter specifies the text to be displayed in the opening of the blog post.
  /// The [imageUrl] parameter specifies the URL of an image to be displayed in the opening.
  const Opening({
    Key? key,
    required this.text,
    this.imageUrl,
  }) : super(key: key);

  /// The text to be displayed in the opening of the blog post.
  final String text;

  /// The URL of the image to be displayed in the opening of the blog post.
  final String? imageUrl;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: h4TextStyle(),
      ),
      if (imageUrl != null)
        Image.network(
          imageUrl ?? '',
          errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace) {
            return const ImageErrorBuilder();
          },
          loadingBuilder: (BuildContext context, Widget widget, ImageChunkEvent? imageChunkEvent) {
            return const image_builders.ImageLoadingBuilder();
          },
        ),
    ],
  );
}
