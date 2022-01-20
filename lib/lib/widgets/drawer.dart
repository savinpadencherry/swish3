import 'package:flutter/material.dart';
import 'package:swish/lib/drawerscreen/dashboardpage.dart';
import 'package:swish/pages/catalogue.dart';
import 'dart:math' as math;

class CustomDrawer extends StatefulWidget {
  final Widget child;
  const CustomDrawer({Key key, this.child}) : super(key: key);

  _CustomDrawerState of(BuildContext context) =>
      context.findAncestorStateOfType<_CustomDrawerState>();

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  static const Duration toggleDuration = Duration(milliseconds: 250);
  static const double maxSlide = 300;
  static const double minDragStartEdge = 60;
  static const double maxDragStartEdge = maxSlide - 16;
  AnimationController _animationController;
  bool _canBeDragged = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  void open() => _animationController.forward();
  void close() => _animationController.reverse();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: _onDragEnd,
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      //     onTap: toggle,
      behavior: HitTestBehavior.translucent,
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Material(
              child: Stack(
                children: [
                  Transform.translate(
                    offset:
                        Offset(maxSlide * (_animationController.value - 1), 0),
                    child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(
                              math.pi / 2 * (1 - _animationController.value)),
                        alignment: Alignment.centerRight,
                        child: MyDrawer()),
                  ),
                  Transform.translate(
                    offset: Offset(maxSlide * (_animationController.value), 0),
                    child: Transform(
                      child: SwishBody2(),
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(-math.pi * _animationController.value / 2),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Positioned(
                    top: 4.0 + MediaQuery.of(context).padding.top,
                    left: 4.0 + _animationController.value * maxSlide,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: toggle,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 16.0 + MediaQuery.of(context).padding.top,
                    left: _animationController.value *
                        MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Shopping',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  void _onDragStart(DragStartDetails details) {
    //if we can start or close the drawer
    bool isDragOpenFromLeft = _animationController.isDismissed;
    bool isDragCloseFromRight = _animationController.isCompleted;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details1) {
    //how big was the gesture the user applied
    if (_canBeDragged) {
      double delta = details1.primaryDelta / maxSlide;
      //add it to the animation controllers value
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed && _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() > 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }
}

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Material(
        color: Colors.deepOrange,
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 40.0,
              ),
              Image.asset(
                'assets/logo.png',
                width: 200,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                ),
                child: ListTile(
                  leading: Icon(Icons.dashboard),
                  title: Text("Dashboard"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart_sharp),
                title: Text("Orders"),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Customer"),
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text("Supplier"),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text("Staff"),
              ),
              ListTile(
                leading: Icon(Icons.branding_watermark),
                title: Text("Brand"),
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text("Category"),
              ),
              ListTile(
                leading: Icon(Icons.ad_units),
                title: Text("Units"),
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart_rounded),
                title: Text("Purchases"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
