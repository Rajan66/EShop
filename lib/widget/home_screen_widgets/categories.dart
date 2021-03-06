import 'dart:convert';
import 'package:electronic_shop/constants/app_constants.dart';
import 'package:electronic_shop/items/items.dart';
import 'package:electronic_shop/widget/home_screen_widgets/get_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "All",
    "Laptop",
    "Mobile",
    "Watch",
    "Keyboard",
    "Headset"
  ];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<String> _loadData() async {
    return await rootBundle.loadString("assets/electronic_shop.json");
  }

  Future<Shop> loadData() async {
    String jsonString = await _loadData();
    final jsonResponse = json.decode(jsonString);
    Shop shop = Shop.fromJson(jsonResponse);

    return shop;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, kDefaultPadding),
            child: SizedBox(
              height: 25,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategory(index),
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: FutureBuilder(
                    future: loadData(),
                    //TODO apidata.loaddata() how to use a function of an another class without inheriting
                    builder: (context, data) {
                      if (data.hasError) {
                        return Center(child: Text("${data.error}"));
                      } else if (data.hasData) {
                        var items = data.data as Shop;
                        return GetCategory(categories[selectedIndex], items);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
          ),
        ],
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
              height: 2,
              width: 30,
              color:
                  selectedIndex == index ? Colors.black87 : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

