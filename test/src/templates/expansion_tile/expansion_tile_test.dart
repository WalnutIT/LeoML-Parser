// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013103535
// 13.10.2023 10:35
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoml_parser/src/exception/atomic_object_is_not_string_exception.dart';
import 'package:leoml_parser/src/exception/list_is_empty_exception.dart';
import 'package:leoml_parser/src/leo_ml_document_parser.dart';
import 'package:leoml_parser/src/templates/constants.dart';
import 'package:leoml_parser/src/templates/default_text_styles.dart';
import 'package:leoml_parser/src/templates/expansion_tile/expansion_tile_1.dart';
import 'package:leoml_parser/src/templates/stateless_widget_template.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';

import '../../../test_documents/expansion_tile/expansion_tile_1_data.dart';
import '../../../test_documents/list_does_not_contains_enough_elements_json.dart';

void main() {
  group('positive tests', () {
    test("has custom widget 'h1'", () {
      // given
      const key = h1;

      // when

      final expansionTile =
          ExpansionTile1(h1Builder: MyCustomTestWidget());
      final actual = expansionTile.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'h2'", () {
      // given
      const key = h2;

      // when
      final expansionTile =
          ExpansionTile1(h2Builder: MyCustomTestWidget());
      final actual = expansionTile.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'h3'", () {
      // given
      const key = h3;

      // when
      final expansionTile =
          ExpansionTile1(h3Builder: MyCustomTestWidget());
      final actual = expansionTile.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'h4'", () {
      // given
      const key = h4;

      // when
      final expansionTile =
          ExpansionTile1(h4Builder: MyCustomTestWidget());
      final actual = expansionTile.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'li'", () {
      // given
      const key = li;

      // when
      final expansionTile =
          ExpansionTile1(liBuilder: MyCustomTestWidget());
      final actual = expansionTile.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });
    test("has custom widget 'tx'", () {
      // given
      const key = tx;

      // when
      final expansionTile =
          ExpansionTile1(txBuilder: MyCustomTestWidget());
      final actual = expansionTile.hasCustomWidget(key: key);

      // then
      expect(actual, isTrue);
    });

    test('is returning the h1 widget', () {
      // given
      const key = h1;
      final listOfObjects = jsonDecode(expansionTile1) as List;
      var object = [];

      object = listOfObjects.firstWhere((element) {
        if (element is List &&
            (element.firstWhere((element) => (element as Map).containsKey(key))
                    as Map)
                .containsKey(h1)) {
          return true;
        }

        return false;
      });

      // when
      final expansionTile = ExpansionTile1(h1Builder: MyCustomH1Builder());
      final actual = expansionTile.buildCustomWidget(
        key: key,
        object: object.firstWhere(
          (element) => (element as Map).containsKey(
            key,
          ),
        ),
      );

      // then
      expect(actual is MyCustomH1, isTrue);
    });
    test('is returning the h2 widget', () {
      // given
      const key = h2;
      final listOfObjects = jsonDecode(expansionTile1) as List;
      var object = [];

      object = listOfObjects.firstWhere((element) {
        if (element is List &&
            (element.firstWhere((element) => (element as Map).containsKey(key))
            as Map)
                .containsKey(h2)) {
          return true;
        }

        return false;
      });

      // when
      final expansionTile = ExpansionTile1(h2Builder: MyCustomH2Builder());
      final actual = expansionTile.buildCustomWidget(
        key: key,
        object: object.firstWhere(
              (element) => (element as Map).containsKey(
            key,
          ),
        ),
      );

      // then
      expect(actual is MyCustomH2, isTrue);
    });
    test('is returning the h3 widget', () {
      // given
      const key = h3;
      final listOfObjects = jsonDecode(expansionTile1) as List;
      var object = [];

      object = listOfObjects.firstWhere((element) {
        if (element is List &&
            (element.firstWhere((element) => (element as Map).containsKey(key))
            as Map)
                .containsKey(h3)) {
          return true;
        }

        return false;
      });

      // when
      final expansionTile = ExpansionTile1(h3Builder: MyCustomH3Builder());
      final actual = expansionTile.buildCustomWidget(
        key: key,
        object: object.firstWhere(
              (element) => (element as Map).containsKey(
            key,
          ),
        ),
      );

      // then
      expect(actual is MyCustomH3, isTrue);
    });
    test('is returning the h4 widget', () {
      // given
      const key = h4;
      final listOfObjects = jsonDecode(expansionTile1) as List;
      var object = [];

      object = listOfObjects.firstWhere((element) {
        if (element is List &&
            (element.firstWhere((element) => (element as Map).containsKey(key))
            as Map)
                .containsKey(h4)) {
          return true;
        }

        return false;
      });

      // when
      final expansionTile = ExpansionTile1(h4Builder: MyCustomH4Builder());
      final actual = expansionTile.buildCustomWidget(
        key: key,
        object: object.firstWhere(
              (element) => (element as Map).containsKey(
            key,
          ),
        ),
      );

      // then
      expect(actual is MyCustomH4, isTrue);
    });
    test('is returning the li widget', () {
      // given
      const key = li;
      final listOfObjects = jsonDecode(expansionTile1) as List;
      var object = [];

      object = listOfObjects.firstWhere((element) {
        if (element is List &&
            (element.firstWhere((element) => (element as Map).containsKey(key))
            as Map)
                .containsKey(li)) {
          return true;
        }

        return false;
      });

      // when
      final expansionTile = ExpansionTile1(liBuilder: MyCustomLiBuilder());
      final actual = expansionTile.buildCustomWidget(
        key: key,
        object: object.firstWhere(
              (element) => (element as Map).containsKey(
            key,
          ),
        ),
      );

      // then
      expect(actual is MyCustomList, isTrue);
    });
    test('is returning the tx widget', () {
      // given
      const key = tx;
      final listOfObjects = jsonDecode(expansionTile1) as List;
      var object = [];

      object = listOfObjects.firstWhere((element) {
        if (element is List &&
            (element.firstWhere((element) => (element as Map).containsKey(key))
            as Map)
                .containsKey(tx)) {
          return true;
        }

        return false;
      });

      // when
      final expansionTile = ExpansionTile1(txBuilder: MyCustomTxBuilder());
      final actual = expansionTile.buildCustomWidget(
        key: key,
        object: object.firstWhere(
              (element) => (element as Map).containsKey(
            key,
          ),
        ),
      );

      // then
      expect(actual is MyCustomTx, isTrue);
    });
  });


  group('negative tests', () {



    test('List does not contains enough elements exception is thrown', () {
      // given
      const leoMLDocument = listIsEmptyJSON;
      const expectedMessage = 'List is empty.';

      // when
      final leoMLDocumentParser = LeoMLDocumentParser();
      final expansionTile1 = ExpansionTile1();

      // then
      expect(
            () async {
          await leoMLDocumentParser.parseToColumn(
            leoMLDocument: leoMLDocument,
            template: expansionTile1,
          );
        },
        throwsA(
          predicate(
                (Exception e) =>
            e is ListIsEmptyException &&
                e.toString() == expectedMessage,
          ),
        ),
        reason:
        'Expected ListIsEmptyException to be thrown',
      );
    });

  });


}

class MyCustomTestWidget extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomTestWidgetTemplate(object: object);
}

class MyCustomTestWidgetTemplate extends StatelessWidgetTemplate {
  const MyCustomTestWidgetTemplate({super.key, required super.object});

  @override
  Widget build(BuildContext context) => const Text(
        'test text',
        style: TextStyle(
          color: Colors.green,
          fontSize: 44.0,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  void validateObject() {
    throw UnimplementedError();
  }
}

class MyCustomH1Builder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) => MyCustomH1(object: object);
}

class MyCustomH1 extends StatelessWidgetTemplate {
  const MyCustomH1({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object[h1],
        style: const TextStyle(
          color: Colors.green,
          fontSize: 44.0,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  void validateObject() {
    if (object[h1] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: h1,
      );
    }
  }
}

class MyCustomH2Builder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) => MyCustomH2(object: object);
}

class MyCustomH2 extends StatelessWidgetTemplate {
  const MyCustomH2({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object[h2],
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 40.0,
          fontWeight: FontWeight.w100,
        ),
      );

  @override
  void validateObject() {
    if (object[h2] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: h2,
      );
    }
  }
}

class MyCustomH3Builder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) => MyCustomH3(object: object);
}

class MyCustomH3 extends StatelessWidgetTemplate {
  const MyCustomH3({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object[h3],
        style: const TextStyle(
          color: Colors.red,
          fontSize: 36.0,
          fontWeight: FontWeight.w500,
        ),
      );

  @override
  void validateObject() {
    if (object[h3] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: h3,
      );
    }
  }
}

class MyCustomH4Builder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) => MyCustomH4(object: object);
}

class MyCustomH4 extends StatelessWidgetTemplate {
  const MyCustomH4({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object[h4],
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 32.0,
          fontWeight: FontWeight.w900,
        ),
      );

  @override
  void validateObject() {
    if (object[h4] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: h4,
      );
    }
  }
}

class MyCustomTxBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) => MyCustomTx(object: object);
}

class MyCustomTx extends StatelessWidgetTemplate {
  const MyCustomTx({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
        object[tx],
        style: const TextStyle(
          color: Colors.green,
          fontSize: 44.0,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  void validateObject() {
    if (object[tx] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: tx,
      );
    }
  }
}

class MyCustomLiBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) => MyCustomList(object: object);
}

class MyCustomList extends StatelessWidgetTemplate {
  const MyCustomList({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Column(
        children: _getTextWidgets(),
      );

  @override
  void validateObject() {
    if (object[li] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: li,
      );
    }
  }

  /// Converts the list of strings into a list of text widgets with bullet points.
  List<Widget> _getTextWidgets() => (object[li].map((String text) {
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
