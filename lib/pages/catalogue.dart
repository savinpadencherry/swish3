import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:swish/widgets/drawer.dart';
import 'package:swish/widgets/search.dart';

class Catalogue extends StatefulWidget {
  @override
  _CatalogueState createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    bool flip = false;
    Widget child = SwishBody2();
    if (flip) {
      child = CustomDrawer(
        child: child,
      );
    } else {
      child = CustomDrawer(
        child: child,
      );
    }
    return child;
  }
}

class SwishBody2 extends StatefulWidget {
  final AppBar appBar;
  const SwishBody2({Key key, this.appBar}) : super(key: key);

  @override
  _SwishBody2State createState() => _SwishBody2State(
        appBar: this.appBar,
      );
}

class _SwishBody2State extends State<SwishBody2> {
  final AppBar appBar;
  _SwishBody2State({
    this.appBar,
  });
  @override
  Widget build(BuildContext context) {
    bool flip = false;
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: flip
          ? AppBar()
          : AppBar(
              elevation: 0,
              backgroundColor: Colors.orange,
              leading: GestureDetector(
                onTap: () => CustomDrawer().of(context).open(),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              actions: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Location',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
      body: SearchBar(),
    );
  }
}
