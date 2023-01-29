import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/localization.dart';
import 'package:website/widgets/responsive_widget.dart';

import 'link_widget.dart';
import 'page_widget.dart';

// ignore: must_be_immutable
class PageAppWidget extends StatefulWidget {
  String title;
  String description;
  String imageAsset;
  String privacyPage;

  PageAppWidget({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.privacyPage,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PageAppWidgetState createState() => _PageAppWidgetState();
}

class _PageAppWidgetState extends State<PageAppWidget> {
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: widget.title,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  _getText(),
                  const SizedBox(height: 20),
                  _getImage(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    _getImage(),
                    const SizedBox(width: 20),
                    Expanded(child: _getText()),
                  ]),
      ),
    );
  }

  Widget _getImage() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 0,
        minHeight: 0,
        maxWidth: 400,
        maxHeight: 400,
      ),
      child: Image(fit: BoxFit.scaleDown, image: AssetImage(widget.imageAsset)),
    );
  }

  Widget _getText() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Text(
            widget.description,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 20),
          LinkWidget(
            text: "Privacy".i18n(),
            underline: false,
            fontSize: 12,
            fontWeight: FontWeight.w200,
            onTap: () => context.go(widget.privacyPage),
          ),
        ]);
  }
}
