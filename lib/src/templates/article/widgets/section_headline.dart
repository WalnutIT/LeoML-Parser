// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704091938
// 04.07.2023 09:19
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';

/// A widget that displays the headline of a section.
class SectionHeadline extends StatelessWidget {
  /// Creates a [SectionHeadline] widget.
  ///
  /// The [sectionHeadline] parameter specifies the text to be displayed as the section headline.
  const SectionHeadline({
    Key? key,
    required this.sectionHeadline,
  }) : super(key: key);

  /// The text to be displayed as the section headline.
  final String sectionHeadline;

  @override
  Widget build(BuildContext context) => Text(
    sectionHeadline,
    style: h4TextStyle(),
  );
}

