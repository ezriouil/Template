import 'package:firebase_auth/firebase_auth.dart';
import 'package:test1/utils/firebase/authentication/sign_up.dart';

class SignUpRepository {
  SignUpRepository._();

  // - - - - - - - - - - - - - - - - - - CREATE ACCOUNT WITH EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {

    UserCredential? userCredential = await SignUp.singUpWithEmailAndPassword(
        email: email, password: password);

    return userCredential;

  }
}
