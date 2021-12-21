// import 'package:flutter/material.dart';
// import 'package:electronic_shop/constants/app_constants.dart';
// import 'package:electronic_shop/widget/home_screen_widgets/categories.dart';
//
// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//           child: Text(
//             "Categories",
//             style: Theme.of(context)
//                 .textTheme
//                 .headline5
//                 .copyWith(fontWeight: FontWeight.bold),
//           ),
//         ),
//         Categories(),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//             child: GridView.builder(
//                 itemCount: 6,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: kDefaultPadding,
//                   crossAxisSpacing: kDefaultPadding,
//                   childAspectRatio: 0.75,
//                 ),
//                 itemBuilder: (context, index) => ItemCard(
//                   product: products[index],
//                 )),
//           ),
//         ),
//       ],
//     );
//   }
// }
