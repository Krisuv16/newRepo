import 'package:ambulance/config/network.dart';
import 'package:ambulance/model/imagemode.dart';
import 'package:ambulance/model/model.dart';
import 'package:get/get.dart';

class AmbulanceController extends GetxController {
  Network api = Network();
  Rx<User> user = User().obs;
  Rx<ImageModel> image = ImageModel().obs;
  RxBool isloading = false.obs;
  RxBool isImageLoading = false.obs;

  @override
  void onInit() {
    fetchInfo();
    fetchImage();
    super.onInit();
  }

  fetchInfo() async {
    isloading.value = true;
    try {
      var response = await api.fetch('users/1');
      user.value = User.fromJson(response);
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
      rethrow;
    }
  }

  fetchImage() async {
    isImageLoading.value = true;
    try {
      var response = await api.fetch('photos/1');
      image.value = ImageModel.fromJson(response);
      isImageLoading.value = false;
    } catch (e) {
      isImageLoading.value = false;
      rethrow;
    }
  }
}
