// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231019083552
// 19.10.2023 08:35
import 'package:example/custom_builder/my_custom_headline_builder.dart';
import 'package:example/example_documents/leoml_document_blog.dart';
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

class BlogExample extends StatefulWidget {
  const BlogExample({super.key});

  @override
  State<BlogExample> createState() => _BlogExampleState();
}

class _BlogExampleState extends State<BlogExample> {
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
        title: const Text('Blog example'),
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
    final blogTemplate = Blog(
      headlineBuilder: MyCustomHeadlineBuilder(),
    );
    final leoMLDocumentParser = LeoMLDocumentParser();
    final newColumn = await leoMLDocumentParser.parseToColumn(
      leoMLDocument: leoMLDocumentBlog,
      template: blogTemplate,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      column = newColumn;
    });
  }
}
