// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704095436
// 04.07.2023 09:54
import 'package:flutter/material.dart';

/// A widget that displays an error icon when an image fails to load.
class ImageErrorBuilder extends StatelessWidget {
  /// Creates an [ImageErrorBuilder] widget.
  const ImageErrorBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
    child: Icon(
      Icons.broken_image_rounded,
      size: 48.0,
    ),
  );
}

