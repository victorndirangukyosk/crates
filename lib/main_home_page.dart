import 'package:executive_app/missing_item_form.dart';
import 'package:executive_app/qr_code_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      MissingItemForm(),
      Container(
        color: Colors.red,
      )
      // QRCodePage()
    ];
    return Scaffold(
      body: pages[context.watch<TabIndexCubit>().state],
      bottomNavigationBar: CupertinoTabBar(
          onTap: (index) {
            context.read<TabIndexCubit>().emit(index);
          },
          currentIndex: context.watch<TabIndexCubit>().state,
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.doc)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.qrcode)),
          ]),
    );
  }
}

class TabIndexCubit extends Cubit<int> {
  TabIndexCubit(int initialState) : super(initialState);
}
