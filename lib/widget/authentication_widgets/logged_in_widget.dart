import 'package:electronic_shop/constants/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:electronic_shop/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      // alignment: Alignment.center,
      // color: Colors.white60,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6,0,0,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            DrawerHeader(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 75,
                backgroundImage: NetworkImage(user!.photoURL!),
              ),
            ),
            // const Text(
            //   'Logged In',
            //   style: TextStyle(color: Colors.black87, fontSize: 18),
            // ),
            const SizedBox(height: 16),
            const SizedBox(height: 8),
            Container(
              child: Text(
                'Name: ' + user.displayName!,
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              child: Text(
                'Email: ' + user.email!,
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text('Logout', style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
