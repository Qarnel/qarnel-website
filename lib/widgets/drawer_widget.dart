// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/localization.dart';
import 'package:website/widgets/link_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LinkWidget(
                onTap: () => context.go("/"),
                text: "QARNEL",
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              LinkWidget(
                onTap: () => context.go("/loupstibook"),
                text: "loupstibook".i18n(),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              LinkWidget(
                icon: const Icon(Icons.code_rounded),
                text: "Code".i18n(),
                onTap: () => js.context.callMethod(
                    'open', ['https://github.com/Qarnel/qarnel-website']),
              ),
              const SizedBox(height: 20),
              LinkWidget(
                icon: const Icon(Icons.mail_rounded),
                text: "Contact".i18n(),
                onTap: () => js.context
                    .callMethod('open', ['mailto:qarnelcom@gmail.com']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
