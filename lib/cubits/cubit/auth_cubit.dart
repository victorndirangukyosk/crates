import 'package:equatable/equatable.dart';
import 'package:executive_app/app_dialogs/app_dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_service.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AuthState state) : super(state);
  Future<UserCredential?> login(
      {required String email, required String password}) async {
    emit(AuthStateLoading());
    try {
      var user = await AuthService.login(email: email, password: password);
      print("login_success:${user.user!.email}");
      // String fcmToken = await FirebaseMessaging.instance.getToken();
      // if (fcmToken != null) {
      //   await FirebaseFirestore.instance
      //       .collection('users')
      //       .doc(user.user.uid)
      //       .collection('tokens')
      //       .doc(fcmToken)
      //       .set({
      //     'token': fcmToken,
      //     'createdAt': FieldValue.serverTimestamp(),
      //     'platform': 'mobile'
      //   });
      // }
      emit(AuthStateAuthenticated(user));
    } catch (e) {
      print(e.toString());
      emit(AuthStateError(e.toString()));
    }
  }

  // Future<UserCredential?> register(
  //     {required Map<String, dynamic> details,
  //     required fb.UserCredential userCredential}) async {
  //   emit(AuthStateLoading());
  //   try {
  //     var user =
  //         await AuthService.register(details: details, user: userCredential);
  //     emit(AuthStateAuthenticated(user));
  //   } catch (e) {
  //     emit(AuthStateError(e.toString()));
  //   }
  // }

  Future requestCode(
      {required String phoneNumber, required BuildContext context}) async {
    emit(AuthStateLoading());
    String? newString(String oldString, int n) {
      if (oldString.length >= n) {
        return oldString.substring(oldString.length - n);
      } else {
        // return whatever you want
      }
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: ("+254${newString(phoneNumber, 9)}"),
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("User verified");
        var x = await FirebaseAuth.instance.signInWithCredential(credential);

        emit(AuthStateAuthenticated(x));
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(AuthStateError(e.message!));
      },
      timeout: Duration(seconds: 30),
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = await AppDialogs.showcodeDialog(context: context);

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        var c = await fb.FirebaseAuth.instance
            .signInWithCredential(phoneAuthCredential);
        emit(AuthStateAuthenticated(c));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Timed out");
        print(verificationId);
      },
    );
  }

  Future verifyCode(
      {required String code, required ConfirmationResult result}) async {
    emit(AuthStateLoading());
    var userCredential =
        await AuthService.enterCode(code: code, result: result);

    emit(AuthStateAuthenticated(userCredential));
  }
}
