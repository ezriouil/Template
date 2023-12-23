import 'package:firebase_auth/firebase_auth.dart';

class ResetThePassword {
  ResetThePassword._();

  // - - - - - - - - - - - - - - - - - - CREATE INSTANCE FROM FIREBASE AUTH - - - - - - - - - - - - - - - - - -  //
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  // - - - - - - - - - - - - - - - - - - RESET THE PASSWORD USING EMAIL - - - - - - - - - - - - - - - - - -  //
  static Future<bool> resetThePassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } catch (_) {
      return false;
    }
  }
}
