import 'package:flutter/material.dart';
import 'package:swish/lib/constants.dart';
import 'package:swish/lib/theme.dart';

class cWidgets {
  static appBar({String title, VoidCallback press}) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: press,
        color: blackish,
      ),
      title: Text(
        title,
        style: subHead1.copyWith(color: blackish),
      ),
      backgroundColor: whitish,
      shadowColor: Colors.transparent,
    );
  }
}
