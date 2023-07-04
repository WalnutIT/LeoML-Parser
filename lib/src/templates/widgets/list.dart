// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704091122
// 04.07.2023 09:11
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';

/// A widget that displays a bullet list of strings.
class BulletList extends StatelessWidget {
  /// Creates a `BulletList` widget.
  ///
  /// The [list] parameter represents the list of strings to be displayed as bullet points.
  const BulletList({
    Key? key,
    required this.list,
  }) : super(key: key);

  /// The list of strings to be displayed as bullet points.
  final List<String> list;

  @override
  Widget build(BuildContext context) => Column(
    children: _getTextWidgets(),
  );

  /// Converts the list of strings into a list of text widgets with bullet points.
  List<Widget> _getTextWidgets() {
    return list.map((text) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          top: 3.0,
        ),
        child: Text(
          '\u2022 $text',
          style: bodyTextStyle(),
        ),
      );
    }).toList();
  }
}
