import 'dart:io';
import 'dart:typed_data';
import 'package:walletapp/Model/BlurModel.dart';
import 'package:blurhash/blurhash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class BlurService {
  Future<void> uploadImage(File image) async {
    var fileName = Uuid().v4();
    var downloadUrl;
    var snapshot = await FirebaseStorage.instance
        .ref()
        .child(UniqueKey().toString())
        .putFile(image);

    await snapshot.ref.getDownloadURL().then((value) {
      downloadUrl = value;
    });

    addImageToFirebase(downloadUrl, image, fileName);
  }

  void addImageToFirebase(
      String imageDownloadUrl, File image, String fileName) async {
    Uint8List pixels = await image.readAsBytes();
    var blurHash = await BlurHash.encode(pixels, 6, 6);

    BlurImage blurImage =
        BlurImage(filepath: fileName, hash: blurHash, url: imageDownloadUrl);
    Map<String, dynamic> blurModel = BlurImage().toJson(blurImage);

    FirebaseFirestore.instance.collection("Pictures").doc().set(blurModel);
    Get.snackbar('Uploaded', 'Image Have Been Uploaded');
  }

  Stream<List<BlurImage>> getImages() {
    return FirebaseFirestore.instance
        .collection('Pictures')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<BlurImage> images = List();
      querySnapshot.docs.forEach((element) {
        images.add(BlurImage.queryDocumentSnapshot(element));
      });
      return images;
    });
  }
}
