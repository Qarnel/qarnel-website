import 'package:flutter/material.dart';

import '../main.dart';

// ignore: must_be_immutable
class LangWidget extends StatefulWidget {
  const LangWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LangWidgetState createState() => _LangWidgetState();
}

class _LangWidgetState extends State<LangWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(Icons.language),
      items: const [
        DropdownMenuItem(
          value: Locale('en'),
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: Locale('fr'),
          child: Text('Français'),
        ),
        DropdownMenuItem(
          value: Locale('pt'),
          child: Text('Português'),
        ),
      ],
      onChanged: (locale) => setState(() {
        if (locale is Locale) {
          MyApp.of(context)?.setLocale(
              
              Locale.fromSubtags(languageCode: locale.languageCode));
        }
      }),
      value: Locale(Localizations.localeOf(context).languageCode),
    );
  }
}
