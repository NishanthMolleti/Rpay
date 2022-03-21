import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart';

class qrcodepage extends StatelessWidget {
  const qrcodepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
//          "/Users/ar-molleti.nishanth/Desktop/project/flutter_application_1/Rakuten_Pay_logo.png",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Center(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //      mainAxisAlignment: MainAxisAlignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: uid,
              version: QrVersions.auto,
              size: 320,
            )
          ],
        ),
      ),
    );
  }
}
