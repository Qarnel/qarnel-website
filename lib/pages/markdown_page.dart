import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
// ignore: depend_on_referenced_packages
import 'package:markdown/markdown.dart' as md;
import 'package:localization/localization.dart';

import '../widgets/page_widget.dart';

class MarkdownPage extends StatefulWidget {
  final String title;
  final String assetName;

  const MarkdownPage({required this.title, required this.assetName, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MarkdownPageState createState() => _MarkdownPageState();
}

class _MarkdownPageState extends State<MarkdownPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return PageWidget(
      title: widget.title,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 0,
          minHeight: 0,
          maxWidth: screenSize.width,
          maxHeight: screenSize.height - kToolbarHeight - 100,
        ),
        child: FutureBuilder(
            future: rootBundle.loadString(widget.assetName),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Markdown(
                  padding: const EdgeInsets.all(30),
                  data: snapshot.data ?? "Error".i18n(),
                  styleSheet: MarkdownStyleSheet(
                    h1: const TextStyle(fontFamily: 'Montserrat'),
                    h2: const TextStyle(fontFamily: 'Montserrat'),
                    textScaleFactor: 1.2,
                    p: const TextStyle(fontFamily: 'Montserrat'),
                  ),
                  extensionSet: md.ExtensionSet(
                    md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                    [
                      md.EmojiSyntax(),
                      ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
