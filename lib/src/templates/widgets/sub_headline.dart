// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704085635
// 04.07.2023 08:56
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';

/// A widget representing a sub headline.
class SubHeadline extends StatelessWidget {
  /// Creates a `SubHeadline` widget.
  ///
  /// The [subHeadline] parameter is the text content of the sub headline.
  const SubHeadline({
    Key? key,
    required this.subHeadline,
  }) : super(key: key);

  /// The text content of the sub headline.
  final String subHeadline;

  @override
  Widget build(BuildContext context) {
    return Text(
      subHeadline,
      style: h3TextStyle(),
    );
  }
}

