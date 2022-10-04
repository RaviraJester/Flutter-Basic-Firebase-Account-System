import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

   Future <void> registerFirebaser(String email, String password) async {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
   }

  Future <void> loginFirebaser(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

}