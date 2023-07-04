// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704095647
// 04.07.2023 09:56
import 'package:flutter/material.dart';

/// A widget that displays a loading indicator while an image is being loaded.
class ImageLoadingBuilder extends StatelessWidget {
  /// Creates an [ImageLoadingBuilder] widget.
  const ImageLoadingBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox.square(
    dimension: 48.0,
    child: LinearProgressIndicator(
      color: Color(0xFF000000),
    ),
  );
}

