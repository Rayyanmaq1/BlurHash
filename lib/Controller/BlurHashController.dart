import 'package:get/get.dart';
import 'package:walletapp/Model/BlurModel.dart';
import 'package:walletapp/Service/BlurService.dart';

class BlurHashController extends GetxController {
  RxList<BlurImage> imageController = RxList<BlurImage>();
  @override
  void onInit() {
    super.onInit();
    imageController.bindStream(BlurService().getImages());
  }
}
