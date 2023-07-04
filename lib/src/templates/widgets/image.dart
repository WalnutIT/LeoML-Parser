// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704091756
// 04.07.2023 09:17
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';

/// A widget that represents an image with an optional description.
class LeoImage extends StatelessWidget {
  /// Creates a [LeoImage] widget.
  ///
  /// The [imageUrl] parameter specifies the URL of the image.
  /// The [imageDescription] parameter specifies the description of the image (optional).
  const LeoImage({
    Key? key,
    required this.imageUrl,
    this.imageDescription,
  }) : super(key: key);

  /// The URL of the image.
  final String imageUrl;

  /// The description of the image.
  final String? imageDescription;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Image.network(imageUrl),
      if (imageDescription != null)
        Column(
          children: [
            const SizedBox(
              height: 6.0,
            ),
            Text(
              imageDescription ?? '',
              style: smallTextStyle(),
            ),
          ],
        ),
    ],
  );
}
