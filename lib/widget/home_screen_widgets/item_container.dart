import 'package:electronic_shop/items/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemContainer extends StatelessWidget {

  final Shop shop;
  final int index;

  ItemContainer(this.shop,this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(

              image: DecorationImage(
                  image: NetworkImage('https://electronic-ecommerce.herokuapp.com/fantechHeadset.jpg'),
                  fit: BoxFit.fill
              ),
              shape: BoxShape.rectangle),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
          child: Text(
            "${shop.data?.product[index].name}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: Text(
            "Price: ${shop.data?.product[index].price}",
            style: TextStyle(fontSize: 15),
          ),
        ),
        SizedBox(
          height: 6,
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 7, 0, 0),
              child: Text(
                "Stock: ${shop.data?.product[index].stock}",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(Icons.shopping_cart),
            )
          ],
        )
      ],
    );
  }
}
