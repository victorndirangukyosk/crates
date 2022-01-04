import 'dart:convert';

import 'package:executive_app/cubits/qr_code_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Crate scanner"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
              height: 200,
              width: 200,
              child: QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) {
                    this.qController = controller;
                    setState(() {
                      controller.scannedDataStream.listen((scanData) async {
                        print(scanData.code);
                        if (!context
                            .read<QRCodeCubit>()
                            .state
                            .contains(scanData.code)) {
                          context.read<QRCodeCubit>().state.add(scanData.code!);
                          FlutterBeep.beep();
                        } else {
                          // FlutterBeep.playSysSound(
                          //     AndroidSoundIDs.TONE_SUP_ERROR);
                        }
                        // setState(() {
                        //   result = scanData;
                        // });
                      });
                    });
                  })),
          SizedBox(
            height: 20,
          ),
          CupertinoButton(
              child: Text("Scan crate"), color: Colors.blue, onPressed: () {}),
        ],
      ),
    );
  }
}
