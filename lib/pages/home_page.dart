import 'package:flutter/material.dart';

import 'package:localization/localization.dart';

import '../widgets/page_widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  final String title = 'QARNEL';

  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: widget.title,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          "phrase_flutter".i18n(),
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
