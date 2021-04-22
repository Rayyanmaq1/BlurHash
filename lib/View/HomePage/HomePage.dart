import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:image_picker/image_picker.dart';
import 'package:walletapp/Service/BlurService.dart';
import 'package:walletapp/Controller/BlurHashController.dart';
import 'package:walletapp/View/Fullimage/FullImage.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  File image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Blurhash',
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          elevation: 0,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.upload_rounded,
                  color: Colors.white,
                ),
                onPressed: () async {
                  // ignore: deprecated_member_use
                  File image = await ImagePicker.pickImage(
                      source: ImageSource.gallery, imageQuality: 100);
                  BlurService().uploadImage(image);
                })
          ],
          backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(20, 30, 48, 1),
                  Color.fromRGBO(36, 59, 85, 1),
                ],
              )),
              child: GetX<BlurHashController>(builder: (controller) {
                return controller.imageController.length != 0
                    ? GridView.builder(
                        itemCount: controller.imageController.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 2.2,
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => FullImage(
                                  blurImage:
                                      controller.imageController[index]));
                            },
                            child: Hero(
                              tag: controller.imageController[index].url,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: BlurHash(
                                  hash: controller.imageController[index].hash,
                                  image: controller.imageController[index].url,
                                ),
                              ),
                            ),
                          );
                        })
                    : Center(
                        child: Text(
                        'No Images Found',
                        style: TextStyle(color: Colors.white),
                      ));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
