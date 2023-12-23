import 'package:test1/utils/firebase/authentication/reset_the_password.dart';

class ResetThePasswordRepository {
  ResetThePasswordRepository._();

  // - - - - - - - - - - - - - - - - - - RESET THE PASSWORD USING EMAIL - - - - - - - - - - - - - - - - - -  //
  static Future<bool> resetThePassword(
      {required String email}) async {
    bool resetThePassword =
        await ResetThePassword.resetThePassword(email: email);

    return resetThePassword;
  }
}
