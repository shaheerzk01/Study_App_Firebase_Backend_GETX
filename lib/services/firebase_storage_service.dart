import 'package:get/get.dart';
import 'package:study_app/firebase_ref/referaces.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async{
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child('question_paper_images')
          .child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e){
      print('Error fetching image URL: $e');
      throw Exception('Error fetching image URL');
    }
  }
}
