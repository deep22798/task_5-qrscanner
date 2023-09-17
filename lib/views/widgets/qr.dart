
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:task5/controller/controller.dart';

class QrScannerWidget extends StatefulWidget {
  QrScannerWidget({Key? key}) : super(key: key);

  @override
  State<QrScannerWidget> createState() => _QrScannerWidgetState();
}

class _QrScannerWidgetState extends State<QrScannerWidget> {
  final qrCodeProvider = Get.put(QrCodeProvider());

  MobileScannerController cameraController = MobileScannerController(
    torchEnabled: false,
  );

  bool isStarted = true;
  String? barcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Builder(
          builder: (context) {
            return SafeArea(
              child: Stack(
                  children: [

                    // Widget Scanner
                    MobileScanner(
                        allowDuplicates: false,
                        fit: BoxFit.contain,
                        controller: cameraController,
                        onDetect: (barcode, args) {
                          setState(() {
                            this.barcode = barcode.rawValue;
                          });
                          qrCodeProvider.resultCode.value = barcode.rawValue!;
                          cameraController.stop();
                          Navigator.pushNamed(context, 'ss');
                        }),

                    //Bottom buttons
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 100,
                        color: Colors.black.withOpacity(0.4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                color: Colors.white,
                                icon: ValueListenableBuilder(
                                  valueListenable: cameraController.torchState,
                                  builder: (context, state, child) {
                                    switch (state as TorchState) {
                                      case TorchState.off:
                                        return const Icon(Icons.flash_off,
                                            color: Colors.grey);
                                      case TorchState.on:
                                        return const Icon(Icons.flash_on,
                                            color: Colors.yellow);
                                    }
                                  },
                                ),
                                iconSize: 32.0,
                                onPressed: () => cameraController.toggleTorch(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  color: Colors.white,
                                  icon: ValueListenableBuilder(
                                    valueListenable: cameraController.cameraFacingState,
                                    builder: (context, state, child) {
                                      switch (state as CameraFacing) {
                                        case CameraFacing.front:
                                          return const Icon(Icons.flip_camera_android_rounded);
                                        case CameraFacing.back:
                                          return const Icon(Icons.flip_camera_android_rounded);
                                      }
                                    },
                                  ),
                                  iconSize: 32.0,
                                  onPressed: () => cameraController.switchCamera(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            );
          }
      ),
    );
  }
}

