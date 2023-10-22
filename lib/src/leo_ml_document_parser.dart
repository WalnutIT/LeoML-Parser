// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704083341
// 04.07.2023 08:33
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/exception/first_object_is_not_type_exception.dart';
import 'package:leoml_parser/src/exception/is_not_list_exception.dart';
import 'package:leoml_parser/src/exception/type_does_not_match_exception.dart';
import 'package:leoml_parser/src/templates/content_template.dart';

/// The LeoMLDocumentParser class provides methods to parse LeoML documents into Flutter widgets.
class LeoMLDocumentParser {
  /// Parses the LeoML document into a [Column] widget using the provided [ContentTemplate].
  ///
  /// The [leoMLDocument] parameter is the LeoML document to parse.
  ///
  /// The [template] parameter is the [ContentTemplate] used for parsing.
  ///
  /// Returns a [Future] that resolves to the parsed [Column] widget.
  Future<Column> parseToColumn({
    required String leoMLDocument,
    required ContentTemplate template,
  }) async =>
      compute<_IsolateModel, Column>(
        _createColumn,
        _IsolateModel(
          leoMLDocument: leoMLDocument,
          contentTemplate: template,
        ),
      );

  /// Parses the LeoML document into a set of [Widget]s using the provided [ContentTemplate].
  ///
  /// The [leoMLDocument] parameter is the LeoML document to parse.
  ///
  /// The [template] parameter is the [ContentTemplate] used for parsing.
  ///
  /// Returns a [Future] that resolves to a [Set] of parsed [Widget]s.
  Future<Set<Widget>> parseToSet({
    required String leoMLDocument,
    required ContentTemplate template,
  }) async =>
      compute<_IsolateModel, Set<Widget>>(
        _createSet,
        _IsolateModel(
          leoMLDocument: leoMLDocument,
          contentTemplate: template,
        ),
      );
}

/// An internal model class used for isolates communication.
class _IsolateModel {
  const _IsolateModel({
    required this.leoMLDocument,
    required this.contentTemplate,
  });

  final ContentTemplate contentTemplate;
  final String leoMLDocument;
}

/// Creates a [Column] widget based on the parsed LeoML document.
Column _createColumn(_IsolateModel isolateModel) {
  var record = _parseLeoMLDocument(isolateModel);

  return isolateModel.contentTemplate.parseToColumn(
    parsedLeoMLDocument: record.$1,
    type: record.$2,
    isRoot: true,
  );
}

/// Creates a set of [Widget]s based on the parsed LeoML document.
Set<Widget> _createSet(_IsolateModel isolateModel) {
  var record = _parseLeoMLDocument(isolateModel);

  return isolateModel.contentTemplate.parseToSet(
    parsedLeoMLDocument: record.$1,
    type: record.$2,
    isRoot: true,
  );
}

/// Parses the LeoML document, asserts its validity, and returns the parsed list.
(List, String) _parseLeoMLDocument(_IsolateModel isolateModel) {
  final list = jsonDecode(
    isolateModel.leoMLDocument,
  );

  if (list is! List) {
    throw IsNotListException();
  }

  if (list.first.keys.toList().first != 'type') {
    throw FirstObjectIsNotTypeException();
  }

  if (list.first['type'] != isolateModel.contentTemplate.type) {
    throw TypeDoesNotMatchException();
  }

  final type = list.first['type'];

  list.removeAt(0);

  return (list, type);
}
