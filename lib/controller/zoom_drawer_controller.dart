import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:study_app/controller/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyZoomDrawerController extends GetxController{

  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady(){
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut(){
    Get.find<AuthController>().signOut();
  }

  void github(){
    _launch("https://github.com/shaheerzk01");
  }
  void website(){
    _launch("https://shaheer-zaman-6e188.web.app/");
  }

  void facebook(){
    _launch("https://www.facebook.com");
  }

  void email(){
    final Uri emaillaunchUri = Uri(
      scheme: 'mailto',
      path: 'shaheerzamank@gmail.com'
    );
    _launch(emaillaunchUri.toString());
  }

  Future<void>_launch(String url)async{
    if(!await launch(url)){
      throw 'could not launch $url';
    }
  }
}