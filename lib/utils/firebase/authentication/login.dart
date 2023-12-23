import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login {
  Login._();

  // - - - - - - - - - - - - - - - - - - CREATE INSTANCES FROM AUTH METHODS- - - - - - - - - - - - - - - - - -  //
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FacebookAuth _facebookAuth = FacebookAuth.instance;
  static final GoogleSignIn _googleAuth = GoogleSignIn();

  // - - - - - - - - - - - - - - - - - - LOGIN TO ACCOUNT WITH EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    }

    // - - - EXCEPTION 1 - - - //
    on FirebaseAuthException catch (_) {
      return null;
    }

    // - - - EXCEPTION 2 - - - //
    on FirebaseException catch (_) {
      return null;
    }

    // - - - EXCEPTION 3 - - - //
    on FormatException catch(_){
      return null;
    }

    // - - - EXCEPTION 4 - - - //
    on PlatformException catch (_) {
      return null;
    }
  }

  // - - - - - - - - - - - - - - - - - - LOGIN WITH GOOGLE - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleAuth.signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final OAuthCredential googleAuthCredential =
      GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(googleAuthCredential);
      return userCredential;
    }

    // - - - EXCEPTION - - - //
    on Exception catch (_) {
      return null;
    }
  }

  // - - - - - - - - - - - - - - - - - - LOGIN WITH FACEBOOK - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> loginWithFacebook() async {
    try {
      final loginResult = await _facebookAuth.login();
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);
      final userCredential =
      await _firebaseAuth.signInWithCredential(facebookAuthCredential);
      return userCredential;
    }

    // - - - EXCEPTION - - - //
    on Exception catch (_) {
      return null;
    }
  }
}
