import 'package:flutter/material.dart';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

import 'drawer_widget.dart';
import 'footer_widget.dart';
import 'link_widget.dart';

// ignore: must_be_immutable
class PageWidget extends StatefulWidget {
  String title;
  Widget child;

  PageWidget({required this.title, required this.child, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
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
          //const LangWidget(),
        ],
      ),
      drawer: const DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: screenSize.height - kToolbarHeight,
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: widget.child,
              ),
            ),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
