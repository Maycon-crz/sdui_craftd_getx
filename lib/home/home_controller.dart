import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:craftd_widget/data/model/base/simple_properties.dart';
import 'package:get/get.dart';
import 'package:sdui_craftd_getx/example/main_state.dart';
import 'package:sdui_craftd_getx/home/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;

  HomeController({required HomeRepository repository}) : _repository = repository;

  var state = Rx<MainState>(MainLoadingState());

  Future<void> loadProperties(BuildContext context) async {
    try {      
      final jsonString = await DefaultAssetBundle.of(context).loadString('assets/dynamic.json');
      final List<dynamic> jsonResponse = jsonDecode(jsonString);

      state.value = MainSuccessState(
        properties: jsonResponse.map((properties) {
          return SimpleProperties.fromJson(properties);
        }).toList(),
      );

      await _repository.loadPropertiesHomeUIRepository().then((Response response){
        print(response.body);
      });
    } catch (error, stacktrace) {
      print(stacktrace.toString());
      state.value = MainErrorState(msg: error.toString());
    }
  }
}