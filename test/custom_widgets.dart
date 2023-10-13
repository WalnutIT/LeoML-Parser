// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230804135206
// 04.08.2023 13:52
import 'package:flutter/material.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';

class MyCustomSubHeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomSubHeadline(object: object);
}

class MyCustomSubHeadline extends StatelessWidgetTemplate {
  const MyCustomSubHeadline({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object['subHeadline'],
        style: const TextStyle(
          color: Colors.black,
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  void validateObject() {
    if (object['subHeadline'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'subHeadline',
      );
    }
  }
}

class MyCustomSectionBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomSection(object: object);
}

class MyCustomSection extends StatelessWidgetTemplate {
  const MyCustomSection({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object['section'],
        style: const TextStyle(
          color: Colors.black,
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  void validateObject() {
    if (object['section'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'section',
      );
    }
  }
}

class MyCustomSectionHeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomSectionHeadline(object: object);
}

class MyCustomSectionHeadline extends StatelessWidgetTemplate {
  const MyCustomSectionHeadline({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object['sectionHeadline'],
        style: const TextStyle(
          color: Colors.black,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  void validateObject() {
    if (object['sectionHeadline'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'sectionHeadline',
      );
    }
  }
}

class MyCustomListBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomList(object: object);
}

class MyCustomList extends StatelessWidgetTemplate {
  const MyCustomList({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Column(
        children: _getTextWidgets(),
      );

  @override
  void validateObject() {
    if (object['list'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'list',
      );
    }
  }

  /// Converts the list of strings into a list of text widgets with bullet points.
  List<Widget> _getTextWidgets() => (object['list'].map((String text) {
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
      }).toList() as List)
          .cast<Widget>();
}

class MyCustomCitationBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomCitation(object: object);
}

class MyCustomCitation extends StatelessWidgetTemplate {
  const MyCustomCitation({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object['citation'],
        style: const TextStyle(
          color: Colors.black,
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  void validateObject() {
    if (object['citation'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'citation',
      );
    }
  }
}

class MyCustomCatchLineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomCatchLine(object: object);
}

class MyCustomCatchLine extends StatelessWidgetTemplate {
  const MyCustomCatchLine({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object['catchLine'],
        style: const TextStyle(
          color: Colors.black,
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  void validateObject() {
    if (object['catchLine'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'catchLine',
      );
    }
  }
}

class MyCustomImageWidget extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomImage(object: object);
}

class MyCustomImage extends StatelessWidgetTemplate {
  const MyCustomImage({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Image.network(
        object['image']['imageURL'],
      );

  @override
  void validateObject() {
    if (object['image']['imageURL'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'imageURL',
      );
    }

    if (object['image'].containsKey('imageDescription') &&
        object['image']['imageDescription'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'imageDescription',
      );
    }
  }
}
