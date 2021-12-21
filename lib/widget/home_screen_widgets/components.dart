import 'package:electronic_shop/config/assets/assets.dart';
import 'package:electronic_shop/widget/authentication_widgets/logged_in_widget.dart';
import 'package:electronic_shop/widget/home_screen_widgets/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electronic_shop/constants/app_constants.dart';

class Components extends StatefulWidget {
  final Widget home;

  Components({required this.home});

  @override
  _ComponentsState createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  int _currentIndex = 0;

  final tabs = [
    Categories(),
    Center(child: Text("fart")),
    LoggedInWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAccentColor,
        title: Text("E-Shop",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
        elevation: 0,
      ),
      body: tabs[_currentIndex],
      backgroundColor: kAccentColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: kAccentColor,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: kProductIcon,
            title: Text('Products'),
            backgroundColor: kAccentColor,
          ),
          BottomNavigationBarItem(
              icon: kCartIcon,
              title: Text('Cart'),
              backgroundColor: kAccentColor),
          BottomNavigationBarItem(
              icon: kProfileIcon,
              title: Text('Profile'),
              backgroundColor: kAccentColor)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
