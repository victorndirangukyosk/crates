import 'dart:io';

import 'package:executive_app/cubits/executive_name_cubit.dart';
import 'package:executive_app/cubits/executive_number_cubit.dart';
import 'package:executive_app/cubits/qr_code_cubit.dart';
import 'package:executive_app/login_cubit/login_cubit.dart';
import 'package:executive_app/login_page.dart';
import 'package:executive_app/main_home_page.dart';
import 'package:executive_app/missing_item_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'cubits/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Get directory to store all state persists (Securely 😊😊)
  Directory storageDirectory = await getTemporaryDirectory();
  await Firebase.initializeApp();

  /// Initialize hydrated storage for all state persists storage
  final storage =
      await HydratedStorage.build(storageDirectory: storageDirectory);

  /// Run the app Zoned in [HydratedBloc] overrides
  HydratedBlocOverrides.runZoned(() => runApp(const App()), storage: storage);
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ProductsCubit([])),
        BlocProvider(
            create: (context) => AuthCubit(AuthStateUnauthenticated())),
        BlocProvider(create: (context) => ExecutiveNameCubit('')),
        BlocProvider(create: (context) => ExecutiveNumberCubit('')),
        BlocProvider(create: (context) => TabIndexCubit(0)),
        BlocProvider(create: (context) => QRCodeCubit([])),
      ],
      child: MaterialApp(
        // theme: CupertinoThemeData(brightness: Brightness.light),
        title: "Executive app",
        supportedLocales: const [
          Locale('en'),
        ],
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: LoginPage(),
      ),
    );
  }
}
