import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task5/controller/controller.dart';
import 'package:task5/views/webview.dart';

class ScannerScreen extends StatefulWidget {
  ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final QrCodeProvider qrCodeProvider = Get.put(QrCodeProvider());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,

        title:  Center(child: Text('Output',style: TextStyle(color: Colors.white),)),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            Navigator.popAndPushNamed(context, '/');
            return Future.value(false);
          },
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon:  Icon(Icons.copy),
                        color: Theme.of(context).primaryColor,
                        onPressed:() {qrCodeProvider.copyToClipboard(qrCodeProvider.resultCode.toString(), context);},
                      ),
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              style:  TextStyle(color: Colors.black),
                              text: qrCodeProvider.resultCode.toString()),
                        ),
                      ), // SelectableText(),
                    ],
                  ),
                ),
                
                MaterialButton(
                  minWidth: 150,
                  height: 50,
                  color: Colors.teal,
                  child: Center(
                    child: Text('Visit',style: TextStyle(
                      fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold
                    ),),
                  ),
                    onPressed:()=>
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => webview( uri:qrCodeProvider.resultCode.toString(),
                            ),
                          ),
                        )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}