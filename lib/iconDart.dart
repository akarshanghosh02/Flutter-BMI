import 'package:flutter/material.dart';
import 'constant.dart';

class IconContent extends StatelessWidget {
  final IconData displayIcon;
  final String caption;
  IconContent(this.displayIcon, this.caption);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          displayIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          caption,
          style: kIconstyle,
        ),
      ],
    );
  }
}
