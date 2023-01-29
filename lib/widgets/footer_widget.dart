// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 10),
          Container(
            color: Colors.blueGrey,
            width: double.maxFinite,
            height: 1,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Qarnel ${DateTime.now().year}",
                style: TextStyle(
                    color: Theme.of(context).primaryTextTheme.overline!.color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
