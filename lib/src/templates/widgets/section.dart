// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704085813
// 04.07.2023 08:58
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';

/// A widget representing a section of text.
class Section extends StatelessWidget {
  /// Creates a `Section` widget.
  ///
  /// The [section] parameter is the text content of the section.
  const Section({
    Key? key,
    required this.section,
  }) : super(key: key);

  /// The text content of the section.
  final String section;

  @override
  Widget build(BuildContext context) {
    return Text(
      section,
      style: bodyTextStyle(),
    );
  }
}

