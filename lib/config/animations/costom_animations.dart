import 'package:electronic_shop/config/assets/assets.dart';
import 'package:electronic_shop/screens/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:electronic_shop/constants/app_constants.dart';

class CostomAnimations extends StatefulWidget {
  final Widget home;
  CostomAnimations({required this.home});

  @override
  _CostomAnimationsState createState() => _CostomAnimationsState();
}

class _CostomAnimationsState extends State<CostomAnimations> {
  double xOffset = 0;

  double yOffset = 0;

  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kAccentColor,
        bottomNavigationBar: CostomBottomNavigationBar(),
        appBar: AppBar(backgroundColor: kAccentColor,title: Text("E-Shop")),
        body: widget.home,
      );
  }
}

// elevation: 0.0,
// leading: isDrawerOpen
// ? IconButton(
// icon: Icon(Icons.arrow_back_ios),
// onPressed: () {
// setState(() {
// xOffset = 0;
// yOffset = 0;
// scaleFactor = 1;
// isDrawerOpen = false;
// });
// },
// )
// : IconButton(
// icon: kMenuIcon,
// onPressed: () {
// setState(() {
// xOffset = 230;
// yOffset = 200;
// scaleFactor = 0.6;
// isDrawerOpen = true;
// });
// },
// tooltip:
// MaterialLocalizations.of(context).openAppDrawerTooltip,
// ),
// actions: [
// kNotificationIcon,
// ],
