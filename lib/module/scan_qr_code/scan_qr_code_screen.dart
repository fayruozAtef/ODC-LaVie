import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodeScreen extends StatefulWidget {

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  var qrKey=GlobalKey();

  QRViewController? controller;

  @override
  void reassemble()async{
    super.reassemble();
    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Scanner'),
        ),
        body: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(
                cutOutSize: MediaQuery.of(context).size.width*0.8,
                borderWidth: 10.0,
                borderRadius: 10.0,
                borderLength: 60.0,
                borderColor: Colors.white
              ),
            )
          ],
        ),
    );
  }

  void onQRViewCreated(QRViewController controller){
    setState(()=>this.controller=controller);
    controller.scannedDataStream.listen((event) { });
  }
}
