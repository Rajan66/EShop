import 'package:electronic_shop/config/custom/border_box.dart';
import 'package:electronic_shop/items/api_data.dart';
import 'package:electronic_shop/widget/authentication_widgets/logged_in_widget.dart';
import 'package:electronic_shop/widget/home_screen_widgets/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electronic_shop/config/assets/assets.dart';
import 'package:electronic_shop/constants/app_constants.dart';

class Components extends StatefulWidget {
  final Widget home;

  const Components({Key? key, required this.home, Column}) : super(key: key);

  @override
  _ComponentsState createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  int _currentIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final tabs = [
    Categories(),
    DataFromAPI(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    return Scaffold(
        key: scaffoldKey,
        drawer: SizedBox(
            width: MediaQuery.of(context).size.width *
                0.75, // 75% of screen will be occupied
            child: LoggedInWidget()),
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(children: [
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BorderBox(
                            height: 55,
                            width: 60,
                            child: IconButton(
                              icon: Icon(Icons.menu, color: COLOR_BLACK),
                              onPressed: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                            ),
                          ),
                          BorderBox(
                            height: 55,
                            width: 60,
                            child: IconButton(
                              icon: Icon(Icons.settings, color: COLOR_BLACK),
                              onPressed: null,
                              color: COLOR_BLACK,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    tabs[_currentIndex]
                  ])
            ])),
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
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
