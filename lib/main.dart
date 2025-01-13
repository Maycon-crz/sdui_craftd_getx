import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdui_craftd_getx/modules/authentication/binding/login_binding.dart';
import 'package:sdui_craftd_getx/modules/authentication/view/login_page.dart';
import 'package:sdui_craftd_getx/modules/home/binding/home_binding.dart';
import 'package:sdui_craftd_getx/modules/home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sdui_craftd_getx/routes/app_pages.dart';
import 'package:sdui_craftd_getx/routes/route_name.dart';


void main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.login,
      getPages: AppPages.pages,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      locale: const Locale('pt', 'BR'), // as traduções serão exibidas para esta localidade
    ),
  );
}