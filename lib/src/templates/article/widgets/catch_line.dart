// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704092004
// 04.07.2023 09:20
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';

/// A widget that displays the catch line of an article.
class CatchLine extends StatelessWidget {
  /// Creates a [CatchLine] widget.
  ///
  /// The [catchLine] parameter specifies the text to be displayed as the catch line.
  const CatchLine({
    Key? key,
    required this.catchLine,
  }) : super(key: key);

  /// The text to be displayed as the catch line.
  final String catchLine;

  @override
  Widget build(BuildContext context) => Text(
    catchLine,
    style: h1TextStyle(),
  );
}

