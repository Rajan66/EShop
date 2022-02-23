import 'package:electronic_shop/items/api_data.dart';
import 'package:electronic_shop/widget/authentication_widgets/logged_in_widget.dart';
import 'package:electronic_shop/widget/home_screen_widgets/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electronic_shop/constants/app_constants.dart';

class Components extends StatefulWidget {
  final Widget home;

  const Components({Key? key, required this.home, Column}) : super(key: key);

  @override
  _ComponentsState createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  int _currentIndex = 0;

  final tabs = [
    Categories(),
    DataFromAPI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          toolbarHeight: 52,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        drawer: Container(
          width: 350,
          child: LoggedInWidget(),
        ),
        body: tabs[_currentIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          height: 50,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 5,
            currentIndex: _currentIndex,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.deepOrange,
            iconSize: 20,
            selectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.phonelink_rounded),
                label: kProductName,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: kCartName,
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ));
  }
}
