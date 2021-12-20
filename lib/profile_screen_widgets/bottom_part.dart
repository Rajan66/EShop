import 'package:electronic_shop/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:electronic_shop/provider/google_sign_in.dart';

class BottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(
            leading: Text(
              "Name",
              style: TextStyle(color: Colors.white),
            ),
            title: Text(
              "@Assar Developer",
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          ListTile(
            leading: Text(
              "Your Number",
              style: TextStyle(color: Colors.white),
            ),
            title: Text(
              "+923352062349",
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          ListTile(
            leading: Text(
              "Your Email",
              style: TextStyle(color: Colors.white),
            ),
            title: Text(
              "assardeveloper@gmail.com",
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: size.height * 0.074,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 12),
            child:ElevatedButton(
                onPressed: () {
                  final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.logout();
                  },
                  child: const Text('Logout'),
              )
            // child: ElevatedButton(
            //     onPressed: () {
            //       final provider =
            //         Provider.of<GoogleSignInProvider>(context, listen: false);
            //         provider.logout();},
            //     style: ElevatedButton.styleFrom(
            //       primary: kPrimaryColor,
            //       textStyle:
            //       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30),
            //       ),
            //     ), // style: ButtonStyle(
            //
            //     child: Text("Log out")),
          ),
          Container(height: size.height * 0.1 - 30)
        ],
      ),
    );
  }
}
