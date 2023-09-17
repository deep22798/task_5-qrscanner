
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Qr Scanner'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () {
          exit(0);
        },
        child: SafeArea(
          child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/qr.json',width: MediaQuery.sizeOf(context).width/2),
                  MaterialButton(
                    onPressed: ()=>Navigator.pushNamed(context, 'qr'),
                    color: Colors.teal,
                    child: Center(child: Text("Scan Here",style: TextStyle(color: Colors.white)),),)
                ],
              )
          ),
        ),
      ),

    );
  }
}
