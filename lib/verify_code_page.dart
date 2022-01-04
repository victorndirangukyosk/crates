import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'missing_item_form.dart';

class VerifyCodePage extends StatelessWidget {
  final PhoneAuthCredential? phoneAuthCredential;
  const VerifyCodePage({Key? key, this.phoneAuthCredential}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var codeController = TextEditingController();
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
              'https://www.kwikbasket.com/image/data/Portal%20Assets/Logo-Opt-1.png'),
          const SizedBox(height: 100),
          CupertinoTextField(
            controller: codeController,
            placeholder: "code",
          ),
          const SizedBox(height: 50),
          CupertinoButton(
              child: const Text("Login"),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop(codeController.text);
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => MissingItemForm()));
              })
        ],
      ),
    );
  }
}
