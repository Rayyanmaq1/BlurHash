import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletapp/View/HomePage/HomePage.dart';
import 'package:walletapp/View/SizedConfig.dart';
import 'package:walletapp/Controller/BlurHashController.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(BlurHashController());
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(() => HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromRGBO(20, 30, 48, 1),
            Color.fromRGBO(36, 59, 85, 1),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Text(
                    "BlurHash",
                    style: TextStyle(
                        fontSize: 3.3 * SizeConfig.textMultiplier,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Load Your Network Image with BlurHash",
                    style: TextStyle(
                      fontSize: 1.5 * SizeConfig.textMultiplier,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[100],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
