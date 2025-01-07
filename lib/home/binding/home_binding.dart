import 'package:get/get.dart';
import 'package:sdui_craftd_getx/api/rest_client.dart';
import 'package:sdui_craftd_getx/home/controller/home_controller.dart';
import 'package:sdui_craftd_getx/home/repository/home_repository.dart';
import 'package:sdui_craftd_getx/database/objectbox_database.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => HomeRepository(rest: Get.find<RestClient>()));
    Get.lazyPut(() => ObjectboxDatabase());
    Get.lazyPut(() => HomeController(
      repository: Get.find<HomeRepository>(),
      database: Get.find<ObjectboxDatabase>(),
    ));
  }
}