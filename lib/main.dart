import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task5/utils/routes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QR Code Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: "/",
      getPages:Pages
    );
  }
}