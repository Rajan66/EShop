import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:electronic_shop/items/items.dart';
import 'package:flutter/services.dart';

class DataFromAPI extends StatefulWidget {
  const DataFromAPI({Key? key}) : super(key: key);

  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  int? id;
  String? name;

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
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder(
            future: loadData(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                var items = data.data as Shop;
                return ListView.builder(
                    itemCount: items == null ? 0 : items.data?.product.length,
                    itemBuilder: (context, index) {
                      return Center(
                          child: Text(
                              '${items.data?.product[index].category[1]}'));
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
