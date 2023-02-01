import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../widgets/page_app_widget.dart';

class LoupstiBookPage extends StatefulWidget {
  static const String routeName = 'loupstibook';
  final String title = "loupstibook".i18n();

  LoupstiBookPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoupstiBookPageState createState() => _LoupstiBookPageState();
}

class _LoupstiBookPageState extends State<LoupstiBookPage> {
  @override
  Widget build(BuildContext context) {
    return PageAppWidget(
      title: "loupstibook".i18n(),
      description: "loupstibook_description".i18n(),
      imageAsset: "loupstibook_screenshot_home".i18n(),
      privacyPage: "/loupstibook/privacy",
    );
  }
}
