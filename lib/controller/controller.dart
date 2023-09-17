import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class QrCodeProvider extends GetxController {
  var resultCode = "".obs;


  Future<void> copyToClipboard(code,context) async {
    await Clipboard.setData(ClipboardData(text: code.toString()));
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      duration: Duration(seconds: 1),
      content: Text('Copied to clipboard'),
    ));
  }

}