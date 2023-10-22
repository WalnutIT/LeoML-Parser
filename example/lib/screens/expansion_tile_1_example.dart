// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231019083637
// 19.10.2023 08:36
import 'package:example/custom_builder/my_custom_headline_builder.dart';
import 'package:example/example_documents/leoml_document_blog.dart';
import 'package:example/example_documents/leoml_document_expansion_tile_1.dart';
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

class ExpansionTile1Example extends StatefulWidget {
  const ExpansionTile1Example({super.key});

  @override
  State<ExpansionTile1Example> createState() => _ExpansionTile1ExampleState();
}

class _ExpansionTile1ExampleState extends State<ExpansionTile1Example> {
  Column column = const Column();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _updateColumn();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Tile 1 example'),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: column.children.isEmpty
                ? const Column(
                    children: [
                      SizedBox(
                        height: 96.0,
                      ),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : column,
          ))
        ],
      ),
    ));
  }

  Future<void> _updateColumn() async {
    final expansionTile1Template = ExpansionTile1();
    final leoMLDocumentParser = LeoMLDocumentParser();
    final resultColumn = await leoMLDocumentParser.parseToColumn(
      leoMLDocument: leoMLDocumentExpansionTile1,
      template: expansionTile1Template,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      column = resultColumn;
    });
  }
}
