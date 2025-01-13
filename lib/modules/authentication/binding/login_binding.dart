import 'package:get/get.dart';
import 'package:sdui_craftd_getx/api/rest_client.dart';
import 'package:sdui_craftd_getx/modules/authentication/controller/login_controller.dart';
import 'package:sdui_craftd_getx/modules/authentication/model/login_model.dart';
import 'package:sdui_craftd_getx/modules/authentication/repository/login_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => LoginRepository(Get.find()));
    Get.lazyPut(() => LoginModel());
    Get.lazyPut(
      () => LoginController(
        Get.find<LoginRepository>(),
        Get.find<LoginModel>(),
      ),
    );
  }
}
