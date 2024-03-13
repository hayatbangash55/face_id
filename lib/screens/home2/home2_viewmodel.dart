import 'package:get/get.dart';


import '../../face_id_auth.dart';

class Home2ViewModel extends GetxController {
  RxBool faceAuthSupported = false.obs;
  RxBool authenticated = false.obs;

  @override
  Future<void> onInit() async {
    faceAuthSupported.value = await FaceIdAuth.canAuthenticate();
    super.onInit();
  }

}
