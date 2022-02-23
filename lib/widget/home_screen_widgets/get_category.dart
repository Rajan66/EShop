import 'package:electronic_shop/constants/app_constants.dart';
import 'package:electronic_shop/widget/home_screen_widgets/item_container.dart';
import 'package:flutter/material.dart';
import 'package:electronic_shop/items/items.dart';

class GetCategory extends StatelessWidget {
  final Shop shop;
  final String category;
  int _index = 0;

  GetCategory(this.category, this.shop, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (shop.data?.product[_index].category[1] == "Category.${category.toUpperCase()}") {
      _index++;
      return GridView.builder(
          itemCount: shop == null ? 0 : shop.data?.product.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 310,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemBuilder: (context, index) {
            return Container(
                //TODO The item card looks shit and isn't consistent in different screen sizes.
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(16)),
                child: ItemContainer(shop, index));
          });
    } else {
      print("Api:${shop.data?.product[_index].category[1]}");
      print("Tab:Category.${category.toUpperCase()}");
      _index++;
      return Center(
        child: Text(
          "Oops, looks like we are out of stock...",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      );
    }
  }
}
