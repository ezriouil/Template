import 'package:firebase_auth/firebase_auth.dart';
import 'package:test1/data/repositories/auth_repository/login_repository.dart';

class SocialMediaAuth {
  SocialMediaAuth._();

  // - - - - - - - - - - - - - - - - - - LOGIN WITH GOOGLE - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> onAuthWithGoogle() async {
    /// AUTH INTO FIREBASE GOOGLE
    UserCredential? userCredential = await LoginRepository.loginWithGoogle();
    if (userCredential == null) {
      return null;
    }

    return userCredential;
  }

  // - - - - - - - - - - - - - - - - - - AUTH WITH FACEBOOK - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> onAuthWithFacebook() async {
    /// AUTH INTO FIREBASE FACEBOOK
    UserCredential? userCredential = await LoginRepository.loginWithFacebook();
    if (userCredential == null) {
      return null;
    }

    return userCredential;
  }
}
