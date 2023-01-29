import 'package:flutter/material.dart';

import 'drawer_widget.dart';
import 'footer_widget.dart';
import 'appbar_widget.dart';

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
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: false,
      appBar: AppBarWidget(widget.title, _opacity),
      drawer: const DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: screenSize.height - kToolbarHeight,
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
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
