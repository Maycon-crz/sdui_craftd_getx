import 'package:get/get.dart';
import 'package:sdui_craftd_getx/api/rest_client.dart';
import 'package:sdui_craftd_getx/home/home_controller.dart';
import 'package:sdui_craftd_getx/home/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => HomeRepository(rest: Get.find<RestClient>()));
    Get.lazyPut(() => HomeController(repository: Get.find<HomeRepository>()));
  }
}