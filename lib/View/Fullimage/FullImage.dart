import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:walletapp/Model/BlurModel.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FullImage extends StatelessWidget {
  FullImage({this.blurImage});
  BlurImage blurImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BlurHash(
          hash: blurImage.hash,
        ),
        Center(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Hero(
              tag: blurImage.url,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BlurHash(
                    hash: blurImage.hash,
                    image: blurImage.url,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
