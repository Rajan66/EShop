import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:electronic_shop/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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


