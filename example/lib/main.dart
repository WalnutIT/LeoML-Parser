import 'package:example/screens/article_example.dart';
import 'package:example/screens/blog_example.dart';
import 'package:example/screens/expansion_tile_1_example.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'LeoML Parser example',
      home: LeoMLParserExampleApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LeoMLParserExampleApp extends StatelessWidget {
  const LeoMLParserExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('LeoML parser examples'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                ListTile(
                  title: const Text('Blog example'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BlogExample()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Article example'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ArticleExample()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Expansion Tile 1 example'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExpansionTile1Example()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
