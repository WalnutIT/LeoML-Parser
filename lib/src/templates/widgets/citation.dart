// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704091720
// 04.07.2023 09:17
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';

/// A widget that represents a citation.
class Citation extends StatelessWidget {
  /// Creates a [Citation] widget.
  ///
  /// The [citation] parameter specifies the text of the citation.
  const Citation({
    Key? key,
    required this.citation,
  }) : super(key: key);

  /// The text of the citation.
  final String citation;

  @override
  Widget build(BuildContext context) => Text(
    citation,
    style: smallTextStyle(),
  );
}

