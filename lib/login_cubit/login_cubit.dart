import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:executive_app/missing_item_form.dart';
import 'package:executive_app/services/login_service.dart';
import 'package:executive_app/verify_code_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_home_page.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  verifyNumber(String phoneNumber, BuildContext context,
      TextEditingController controller) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MainHomePage()));
          emit(LoginSuccess(credential));
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(LoginFailed(e.toString()));
        },
        codeSent: (String verificationId, int? resendToken) async {
          var x = await showCodeDialog(context, controller);
          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = await PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: x);

          // Sign the user in (or link) with the credential
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }

  verifyCOde(
      {required String code,
      required ConfirmationResult confirmationResult}) async {
    emit(LoginLoading());
    try {
      UserCredential x = await LoginService.verifyCode(
          code: code, confirmationResult: confirmationResult);
      emit(LoginSuccessCode(x));
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }
}

Future<String> showCodeDialog(
    BuildContext context, TextEditingController controller) async {
  // var controller = TextEditingController();
  return await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Enter code"),
          content: CupertinoTextField(
            placeholder: "Code here",
            controller: controller,
          ),
          actions: [
            CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop(controller.text);
                  // Navigator.of(context).push(route)
                },
                child: Text("Submit"))
          ],
        );
      });
}
