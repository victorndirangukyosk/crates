import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../verify_code_page.dart';
import 'confirm_user_dialog.dart';

class AppDialogs {
  static Future<bool> showSuccessUserDialog(
      {required BuildContext context,
      required String message,
      required UserInfo userInfo}) async {
    return await showCupertinoDialog(
        context: context,
        builder: (builder) =>
            ConfirmUserSuccessDialog(message: message, userInfo: userInfo));
  }

  static Future showFailedUserDialog(
      {required BuildContext context,
      required String message,
      required UserInfo userInfo}) async {
    return await showCupertinoDialog(
        context: context,
        builder: (builder) =>
            ConfirmUserFailedDialog(message: message, userInfo: userInfo));
  }

  static Future<String> showcodeDialog({required BuildContext context}) async {
    return await showCupertinoDialog(
        context: context, builder: (builder) => VerifyCodePage());
  }
}
