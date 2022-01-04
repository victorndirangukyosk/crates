import 'package:executive_app/main_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cubit/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  String? newString(String oldString, int n) {
    if (oldString.length >= n) {
      return oldString.substring(oldString.length - n);
    } else {
      // return whatever you want
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateAuthenticated) {
          // try {
          //   UserInfo user = await context
          //       .read<UserCubit>()
          //       .getUser(userID: state.userInfo.user!.uid);

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MainHomePage()));
          // } catch (e) {
          //   showCupertinoDialog(
          //       context: context,
          //       builder: (context) => CupertinoAlertDialog(
          //             title: Text("Info"),
          //             content: Text(
          //                 "Please enter your details so that we can clearly identify you"),
          //             actions: [
          //               CupertinoActionSheetAction(
          //                 child: Text("Proceed to enter details"),
          //                 isDestructiveAction: true,
          //                 onPressed: () {
          //                   AutoRouter.of(context).push(RegisterRoute(
          //                       userCredential: state.userInfo,
          //                       phoneNumber:
          //                           "+254${newString(phoneController.text, 9)}"));
          //                 },
          //               ),
          //             ],
          //           ));
          // }
        }
        // catch(e){}
        else if (state is AuthStateError) {
          showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                    title: Text("Error"),
                    content: Text(state.error),
                    actions: [
                      CupertinoActionSheetAction(
                        child: Text("Dismiss"),
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ));
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    Image.network(
                        'https://www.kwikbasket.com/image/data/Portal%20Assets/Logo-Opt-1.png'),
                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      "Login to Kwikbasket",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone number',
                            hintText: '07XXXXXXXX'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        }),
                    // TextFormField(
                    //     controller: passwordController,
                    //     obscureText:
                    //         context.watch<ObscurePasswordCubit>().state,
                    //     decoration: InputDecoration(
                    //         labelText: 'Password',
                    //         suffixIcon: CupertinoButton(
                    //             padding: EdgeInsets.all(0.0),
                    //             onPressed: () {
                    //               context.read<ObscurePasswordCubit>().toggle();
                    //             },
                    //             child: Icon(
                    //                 context.watch<ObscurePasswordCubit>().state
                    //                     ? CupertinoIcons.lock
                    //                     : CupertinoIcons.lock_open))),
                    //     validator: (value) {
                    //       if (value.isEmpty) {
                    //         return 'This field is required';
                    //       }
                    //       return null;
                    //     }),
                    SizedBox(
                      height: 40,
                    ),
                    CupertinoButton(
                      color: Colors.teal,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var user = await context
                              .read<AuthCubit>()
                              .requestCode(
                                  phoneNumber: phoneController.text,
                                  context: context);
                          // AutoRouter.of(context).push(VerifyCodeRoute());
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text.rich(
                        TextSpan(text: "Don't have an account? ", children: [
                      TextSpan(
                          text: "Register here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // AutoRouter.of(context).push(RegisterRoute());
                            },
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.teal)),
                    ])),
                    Text("")
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
