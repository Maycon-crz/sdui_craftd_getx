import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdui_craftd_getx/home/home_binding.dart';
import 'package:sdui_craftd_getx/home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          binding: HomeBinding(),
          page: () => const HomePage(
            title: "Flutter Demo",
          ),
        ),
      ],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      locale: const Locale('pt', 'BR'), // as traduções serão exibidas para esta localidade
    ),
  );
}