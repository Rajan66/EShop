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
  List<Product> all = [];
  List<Product> laptop = [];
  List<Product> mobile = [];
  List<Product> watch = [];
  List<Product> keyboard = [];
  List<Product> headset = [];
  List<Product> currentCategory=[];

  int productIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryList();
    currentCategory = List.from(keyboard);
    print(currentCategory.length);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: currentCategory.length,
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
              child: ItemContainer(widget.shop,index,currentCategory)
          );
        });
  }

  getCategoryList() {
    int i = 0;
    int? length = widget.shop.data!.product.length;
    while (i < length- 1) {
      if ("Category.LAPTOP" ==
          widget.shop.data?.product[i].category[1].toString()) {
        laptop.add(widget.shop.data!.product[i]);
        currentCategory = List.from(laptop);
        productIndex =i;
      } else if ("Cateogry.MOBILE" ==
          widget.shop.data?.product[i].category[1].toString()) {
        mobile.add(widget.shop.data!.product[i]);
        currentCategory = List.from(laptop);
        productIndex =i;
      } else if ("Category.KEYBOARD" ==
          widget.shop.data?.product[i].category[1].toString()) {
        keyboard.add(widget.shop.data!.product[i]);
        currentCategory = List.from(laptop);
        productIndex =i;
      } else if ("Category.WATCH" ==
          widget.shop.data?.product[i].category[1].toString()) {
        watch.add(widget.shop.data!.product[i]);
        currentCategory = List.from(laptop);
        productIndex =i;
      } else if ("Category.HEADSET" ==
          widget.shop.data?.product[i].category[1].toString()) {
        headset.add(widget.shop.data!.product[i]);
        currentCategory = List.from(laptop);
        productIndex =i;
      }
      all.add(widget.shop.data!.product[i]);
      currentCategory = List.from(all);
      i++;
    }
  }
}
