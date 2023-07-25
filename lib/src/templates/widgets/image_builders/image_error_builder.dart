// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704095436
// 04.07.2023 09:54
import 'package:flutter/material.dart';

// ignore_for_file: avoid-unused-parameters
Widget getErrorLoadingBuilder(
  BuildContext context,
  Object object,
  StackTrace? stackTrace,
) {
  return const ImageErrorBuilder();
}

class ImageErrorBuilder extends StatelessWidget {
  const ImageErrorBuilder({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: Icon(
          Icons.broken_image_rounded,
          size: 48.0,
        ),
      );
}
