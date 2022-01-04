import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmUserSuccessDialog extends StatelessWidget {
  final String message;
  final UserInfo userInfo;

  const ConfirmUserSuccessDialog(
      {Key? key, required this.message, required this.userInfo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Confirm user"),
      content: Text("Message"),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text("Accept"),
          isDefaultAction: true,
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text("Dismiss"),
          isDefaultAction: true,
        ),
      ],
    );
  }
}

class ConfirmUserFailedDialog extends StatelessWidget {
  final String message;
  final UserInfo userInfo;

  const ConfirmUserFailedDialog(
      {Key? key, required this.message, required this.userInfo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Confirm user"),
      content: Text("There is no user with that email"),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Dismiss"),
          isDefaultAction: true,
        )
      ],
    );
  }
}
