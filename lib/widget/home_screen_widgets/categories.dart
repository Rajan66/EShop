import 'package:flutter/material.dart';
import 'package:electronic_shop/constants/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:electronic_shop/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool isAll = true;
  bool isLaptop = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Categories",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 29,
          color: Color(0xffFFFFFF),
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isLaptop = false;
                isAll = true;
              });
            },
            child: Tab(
                icon: Text(
                  "ALL",
                  style: TextStyle(
                      fontSize: 16, color: isAll ? Colors.white : Colors.grey),
                )),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isLaptop = true;
                isAll = false;
              });
            },
            child: Tab(
                icon: Text(
                  "Laptop",
                  style: TextStyle(fontSize: 16,
                      color: isLaptop ? Colors.white : Colors.grey),
                )),
          ),
          Tab(
              icon: Text(
                "Headset",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )),
          Tab(
              icon: Text(
                "Xbox one",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )),
          Tab(
              icon: Text(
                "Xbox one X",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )),
        ],
      ),
    );
  }

  @override
  Widget _buildProfile(BuildContext context){
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Logged In',
            style: TextStyle(color: Colors.white,fontSize: 18),
          ),
          const SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 35,
            backgroundImage: NetworkImage(user!.photoURL!),
          ),
          const SizedBox(height: 8),
          Text(
            'Name: ' + user.displayName!,
            style: TextStyle(color: Colors.white,fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            'Email: ' + user.email!,
            style:TextStyle(color: Colors.white,fontSize: 18),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child:  Text('Logout',
                style: TextStyle(fontSize: 16)),
          )
        ],
      ),
    );
  }
}
