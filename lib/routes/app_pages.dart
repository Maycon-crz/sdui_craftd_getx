import 'package:get/get.dart';
import 'package:sdui_craftd_getx/modules/authentication/binding/login_binding.dart';
import 'package:sdui_craftd_getx/modules/authentication/view/login_page.dart';
import 'package:sdui_craftd_getx/modules/home/binding/home_binding.dart';
import 'package:sdui_craftd_getx/modules/home/home_page.dart';
import 'package:sdui_craftd_getx/routes/route_name.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.login,
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteName.home,
      binding: HomeBinding(),
      page: () => const HomePage(title: "Tela inicial"),
    ),
  ];
}
