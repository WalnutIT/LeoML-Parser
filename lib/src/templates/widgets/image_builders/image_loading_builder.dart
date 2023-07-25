// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704095647
// 04.07.2023 09:56
import 'package:flutter/material.dart';

// ignore_for_file: avoid-unused-parameters
Widget getImageLoadingBuilder(
  BuildContext context,
  Widget widget,
  ImageChunkEvent? imageChunkEvent,
) {
  if (imageChunkEvent == null) {
    return widget;
  }

  return ImageLoadingBuilder(imageChunkEvent: imageChunkEvent);
}

/// A widget that displays a loading indicator while an image is being loaded.
class ImageLoadingBuilder extends StatelessWidget {
  /// Creates an [ImageLoadingBuilder] widget.
  const ImageLoadingBuilder({
    Key? key,
    required this.imageChunkEvent,
  }) : super(key: key);

  final ImageChunkEvent imageChunkEvent;

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: 48.0,
        child: CircularProgressIndicator(
          value: imageChunkEvent.expectedTotalBytes != null
              ? imageChunkEvent.cumulativeBytesLoaded /
                  (imageChunkEvent.expectedTotalBytes ??
                      imageChunkEvent.cumulativeBytesLoaded)
              : null,
          color: const Color(0xFF000000),
          strokeWidth: 1.0,
        ),
      );
}

