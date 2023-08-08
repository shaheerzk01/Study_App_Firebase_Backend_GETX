import 'package:get/get.dart';
import 'package:study_app/controller/auth_controller.dart';
import 'package:study_app/firebase_ref/referaces.dart';
import 'package:study_app/logger/app_logger.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/screens/question/question_screen.dart';
import 'package:study_app/services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    getAllPaper();
    super.onReady();
  }

  Future<void> getAllPaper() async {
    List<String> imgName = ['biology', 'chemistry', 'maths', 'physics'];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnaphot(paper))
          .toList();
      allPapers.assignAll(paperList);
      for (var paper in paperList) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateTQuestions({required QuestionPaperModel paper, bool tryAgain=false}){
    AuthController _authController = Get.find();
    if(_authController.isLoggedIn()){
      if(tryAgain){
        Get.back();
        Get.toNamed(QuestionScreen.routeName, arguments: paper, preventDuplicates: false);
      }else{
        Get.toNamed(QuestionScreen.routeName, arguments: paper);
      }
    }else{
      _authController.showLoginAlertDialogue();
    }
  }
}
