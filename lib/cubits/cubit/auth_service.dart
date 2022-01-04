import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static Future<UserCredential> login(
      {required String email, required String password}) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return user;
  }

  // static Future phonePhonerequestCode({String phoneNumber}) async {
  //   var result = await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {},
  //     codeSent: (String verificationId, int resendToken) {},
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  static Future<UserCredential> enterCode(
      {required ConfirmationResult result, required String code}) async {
    var x = await result.confirm(code);
    return x;
  }

  // static Future<UserCredential> register(
  //     {required Map<String, dynamic> details,
  //     required UserCredential user}) async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.user!.uid)
  //       .set(details);
  //   return user;
  // }
}
