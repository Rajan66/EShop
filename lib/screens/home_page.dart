import 'package:electronic_shop/config/animations/costom_animations.dart';
import 'package:electronic_shop/constants/app_constants.dart';
import 'package:electronic_shop/screens/custom_bottom_navigation_bar.dart';
import 'package:electronic_shop/widget/authentication_widgets/logged_in_widget.dart';
import 'package:electronic_shop/widget/home_screen_widgets/categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electronic_shop/provider/google_sign_in.dart';
import 'package:electronic_shop/widget/authentication_widgets/logged_in_widget.dart';
import 'package:electronic_shop/widget/authentication_widgets/sign_up_widget.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.yellowAccent,
    body: ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final provider = Provider.of<GoogleSignInProvider>(context);

          if (provider.isSigningIn) {
            return buildLoading();
          } else if (snapshot.hasData) {
            return DefaultTabController(
                length: 5,child: CostomAnimations(
                  home:Categories()));
          } else {
            return SignUpWidget();
          }
        },
      ),
    ),
  );


  Widget buildLoading() => Stack(
    fit: StackFit.expand,
    children: [
      Center(child: CircularProgressIndicator()),
    ],
  );
}
