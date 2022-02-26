import 'package:electronic_shop/constants/app_constants.dart';
import 'package:electronic_shop/widget/home_screen_widgets/item_container.dart';
import 'package:flutter/material.dart';
import 'package:electronic_shop/items/items.dart';

//Should this be stateful or stateless? The product needs to change according
//to the category so.... STATEFUL?
class GetCategory extends StatefulWidget {

  final Shop shop;
  final String category;
  GetCategory(this.category, this.shop, {Key? key}) : super(key: key);
  @override
  _GetCategoryState createState() => _GetCategoryState();
}

class _GetCategoryState extends State<GetCategory> {

  int productIndex = 0;

  // int i = 0;
  // int all = 0;
  // int laptop = 0;
  // int mobile = 0;
  // int watch = 0;
  // int keyboard = 0;
  // int headset = 0;
  // List<int> categoryCount = [0];



  @override
  Widget build(BuildContext context) {

    return GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: widget.shop == null ? 0 : widget.shop.data?.product.length,
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
              child: ItemContainer(widget.shop, index));
        });
  }

  Widget categoryCounter(items, index) {

    int i =0;
    while (i > 10) {
      if ("Category.${widget.category.toUpperCase()}" ==
          items.data?.product[index].category[1]) {
        return ItemContainer(items, index);
      } else {
        print("Category.${widget.category.toUpperCase()}");
        print("$i\n");
        // print(items.data?.product[i].category[1]);
        return Center(child: Text("Dog"));
      }
    }
    return Center(
      child:CircularProgressIndicator()
    );

    // int i = 0;
    // int? length = items.data?.product.length;
    // while (i < length!-1) {
    //   if ("Category.LAPTOP" == items.data?.product[i].category[1].toString()) {
    //     laptop++;
    //   } else if ("Cateogry.MOBILE" == items.data?.product[i].category[1].toString()) {
    //     mobile++;
    //   } else if ("Category.KEYBOARD" == items.data?.product[i].category[1].toString()) {
    //     keyboard++;
    //   } else if ("Category.WATCH" == items.data?.product[i].category[1].toString()) {
    //     mobile++;
    //   } else if ("Category.HEADSET" == items.data?.product[i].category[1].toString()) {
    //     mobile++;
    //   }
    //   i++;
    //   print(items.data?.product[i].category[1]);
    // }
    // print("Laptop: $laptop\n"
    //     "Mobile: $mobile\n"
    //     "Headset: $headset\n"
    //     "Keyboard: $keyboard\n"
    //     "Watch: $watch");
    //
    // categoryCount = [laptop,mobile,headset,keyboard,watch];
  }
}
