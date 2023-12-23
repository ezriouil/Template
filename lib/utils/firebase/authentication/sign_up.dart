import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class SignUp {
  SignUp._();

  // - - - - - - - - - - - - - - - - - - CREATE INSTANCES FROM AUTH METHODS - - - - - - - - - - - - - - - - - -  //
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // - - - - - - - - - - - - - - - - - - CREATE ACCOUNT WITH EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> singUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
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
    on FormatException catch (_) {
      return null;
    }

    // - - - EXCEPTION 4 - - - //
    on PlatformException catch (_) {
      return null;
    }
  }
}
