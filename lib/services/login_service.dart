import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static Future verifyNumber({required String phoneNumber}) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          throw e.message!;
        },
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<UserCredential> verifyCode(
      {required String code,
      required ConfirmationResult confirmationResult}) async {
    try {
      UserCredential userCredential = await confirmationResult.confirm(code);
      return userCredential;
    } catch (e) {
      throw e.toString();
    }
  }
}
