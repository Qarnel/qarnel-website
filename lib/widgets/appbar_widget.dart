// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

import 'link_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final double opacity;

  const AppBarWidget(this.title, this.opacity, {super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.title,
        style: TextStyle(
          color: Colors.blueGrey[100],
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          letterSpacing: 3,
        ),
      ),
      actions: <Widget>[
        LinkWidget(
          icon: const Icon(Icons.brightness_6),
          onTap: () {
            EasyDynamicTheme.of(context).changeTheme();
          },
        ),
        LinkWidget(
          icon: const Icon(Icons.code_rounded),
          onTap: () => js.context
              .callMethod('open', ['https://github.com/Qarnel/qarnel-website']),
        ),
        LinkWidget(
          icon: const Icon(Icons.mail_rounded),
          onTap: () =>
              js.context.callMethod('open', ['mailto:qarnelcom@gmail.com']),
        ),
      ],
    );
  }
}
