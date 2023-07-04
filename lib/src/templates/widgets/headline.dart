// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704085106
// 04.07.2023 08:51
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';

/// A widget that represents a headline.
class Headline extends StatelessWidget {
  /// Creates a [Headline] widget.
  ///
  /// The [headline] parameter specifies the text of the headline.
  const Headline({
    Key? key,
    required this.headline,
  }) : super(key: key);

  /// The text of the headline.
  final String headline;

  @override
  Widget build(BuildContext context) => Text(
    headline,
    style: h2TextStyle(),
  );
}

