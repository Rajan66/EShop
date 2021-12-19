// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthenticationService{
//   final FirebaseAuth _firebaseAuth;
//
//   AuthenticationService(this._firebaseAuth);
//
//   Future<String> signIn({required String email, required String password}) async{
//     try{
//       await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       return "Signed In";
//     }on FirebaseAuthException catch(e){
//       return e.message;
//     }
//   }
//
//   Future<String> signUp({required String email, requried String password}){
//     try{
//
//     }on FirebaseAuthException catch()
//   }
// }