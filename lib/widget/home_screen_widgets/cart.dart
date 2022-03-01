import 'package:electronic_shop/items/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final List<Product>? list;

  const Cart({ this.list, Key? key}) : super(key: key);
  //TODO get the list of cart and display it..
  @override
  Widget build(BuildContext context) {
    // print(list![1]!.name);
    if (list != null) {
      return Flexible(
          fit: FlexFit.loose,
          child: Center(
            child: Text(list![0].name),
          ));
    } else {
      return Center(
        heightFactor: 20,
        child: Text(
          "Oops.. the cart is empty!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 20
          ),
        ),
      );
    }
  }
}
