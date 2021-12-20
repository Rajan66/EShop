import 'package:electronic_shop/constants/app_constants.dart';
import 'package:electronic_shop/profile_screen_widgets/bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'custom_bottom_navigation_bar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Your Profile",
          style: TextStyle(color: Colors.grey[400], fontSize: 17),
        ),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      bottomNavigationBar: CostomBottomNavigationBar(),
      backgroundColor: kAccentColor,
      body: Stack(
        // alignment: Alignment.s,
        children: [
          Container(
            height: size.height * 0.33,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
          ),
          BottomPart(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: size.height * 0.26),
                height: size.height * 0.32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 10, offset: Offset(3, 6)),
                  ],
                  color: kAccentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.18,
                      width: size.height * 0.18,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 5, offset: Offset(3, 5)),
                        ],
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(user!.photoURL!)),
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(70),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      user!.displayName!,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: size.height*0.025,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
