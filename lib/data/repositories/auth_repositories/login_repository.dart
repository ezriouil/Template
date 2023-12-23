import 'package:firebase_auth/firebase_auth.dart';
import 'package:test1/utils/firebase/authentication/login.dart';

class LoginRepository {
  LoginRepository._();

  // - - - - - - - - - - - - - - - - - - LOGIN WITH EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential? userCredential =
        await Login.loginWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }

  // - - - - - - - - - - - - - - - - - - LOGIN WITH GOOGLE - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> loginWithGoogle() async {
    UserCredential? userCredential = await Login.loginWithGoogle();
    return userCredential;
  }

  // - - - - - - - - - - - - - - - - - - LOGIN WITH FACEBOOK - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> loginWithFacebook() async {
    UserCredential? userCredential = await Login.loginWithFacebook();
    return userCredential;
  }
}
