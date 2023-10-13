// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013095958
// 13.10.2023 09:59
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';

/// A widget that displays text content.
///
/// The `Tx` widget is used to render text content from a LeoML document. It takes
/// a `txBuilder` parameter, which represents the text content to be displayed.
///
/// Usage:
///
/// ```dart
/// const leoMLObject = {'tx': 'This is some text content.'};
/// return Tx(
///   object: leoMLObject,
/// );
/// ```
class Tx extends StatelessWidgetTemplate {
  /// Creates a `Tx` widget.
  ///
  /// The [key] is an optional identifier, and the [object] must contain a 'tx'
  /// key with a corresponding String value representing the text content.
  const Tx({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      object[tx],
      style: bodyTextStyle(),
    );
  }

  @override
  void validateObject() {
    if (object[tx] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: tx,
      );
    }
  }
}
