import 'package:get/get.dart';

class SplashController extends GetxController{
  SplashController(){
    gotoHome();
  }

  void gotoHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.offAndToNamed('/home');
  }


}
