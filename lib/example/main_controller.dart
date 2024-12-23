// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:craftd_widget/data/model/base/simple_properties.dart';
// import 'package:mobx/mobx.dart';

// import 'main_state.dart';

// part 'main_controller.g.dart';

// class MainController extends MainControllerBase with _$MainController {
//   MainController();
// }

// abstract class MainControllerBase with Store {
//   MainControllerBase();

//   @observable
//   MainState state = MainLoadingState();

//   @action
//   Future<void> loadProperties(BuildContext context) async {
//     try {
//       final jsonString = await DefaultAssetBundle.of(context).loadString('assets/dynamic.json');
//       final List<dynamic> jsonResponse = jsonDecode(jsonString);

//       state = MainSuccessState(
//         properties: jsonResponse.map((properties) {
//           return SimpleProperties.fromJson(properties);
//         }).toList(),
//       );
//     } catch (error, stacktrace) {
//       print(stacktrace.toString());
//       state = MainErrorState(msg: error.toString());
//     }
    
//     // await DefaultAssetBundle.of(context)
//     //     .loadString("assets/dynamic.json")
//     //     .then((value) {
//     //   List<dynamic> list = jsonDecode(value);

//     //   /*
//     //     Ao inves de usar isso acima em producao seria usado uma chamada ao 
//     //     repository que realiza a requisicao ao backend retornando o Json 
//     //     Dinamico para ser tratado abaixo.
//     //   */

//     //   state = MainSuccessState(
//     //       properties: list.map((properties) {
//     //     return SimpleProperties.fromJson(properties);
//     //   }).toList());
//     // }).catchError((error, stacktrace) {
//     //   print(stacktrace.toString());
//     //   state = MainErrorState(msg: stacktrace.toString());
//     // });
//   }
// }
