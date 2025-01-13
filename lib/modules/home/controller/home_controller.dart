import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:craftd_widget/data/model/base/simple_properties.dart';
import 'package:get/get.dart';
import 'package:sdui_craftd_getx/database/objectbox.g.dart';
import 'package:sdui_craftd_getx/database/objectbox_database.dart';
import 'package:sdui_craftd_getx/custom/craftd/main_state.dart';
import 'package:sdui_craftd_getx/modules/home/entity/component_dto.dart';
// import 'package:get/get_connect/connect.dart';
import 'package:sdui_craftd_getx/modules/home/entity/home_screen_entity.dart';
import 'package:sdui_craftd_getx/modules/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;

  late final ObjectboxDatabase _database;

  HomeController({
    required HomeRepository repository,
    required ObjectboxDatabase database,
  }) : _repository = repository, _database = database;

  var state = Rx<MainState>(MainLoadingState());

  HomeScreenEntity homeScreenEntity = HomeScreenEntity();
  List<HomeScreenEntity> listHomeScreenEntity = [];

  Future<Box> getBox() async{
    final store = await _database.getStore();
    return store.box<HomeScreenEntity>();
  }

  getLocalDataScreen() async {
    Box box = await getBox();    
    listHomeScreenEntity = box.getAll() as List<HomeScreenEntity>;
    print("getLocalDataScreen");
    print(listHomeScreenEntity.length);
    update();
  }

  Future<void> loadProperties(BuildContext context) async {
    // try {
      // final Store store = await openStore(directory: 'person-db');
      // final box = store.box<Person>();

      await getLocalDataScreen();
      if(listHomeScreenEntity.isNotEmpty){
        homeScreenEntity = listHomeScreenEntity.last;
        
        if (homeScreenEntity.components != null) {
          List<dynamic>? componentsJson = jsonDecode(homeScreenEntity.components!) as List<dynamic>;
          List<ComponentDTO>? componentsList = componentsJson.map((componentJson) => ComponentDTO.fromJson(componentJson as Map<String, dynamic>)).toList();

          state.value = MainSuccessState(
            properties: componentsList.map((component) {
              return SimpleProperties.fromJson(component.toJson());
            }).toList(),
          );
        } else {
          print('components é nulo');
        }
      }else{
        Response<dynamic> response = await _repository.loadPropertiesHomeUIRepository();
        print(response.body);
        if (response.statusCode == 200) {
          final jsonResponse = response.body;
          final data = jsonResponse['data'];
          final components = data['components'] as List<dynamic>;

          homeScreenEntity = HomeScreenEntity.fromJson(data);
          homeScreenEntity.id = 0;//Definando como zero para nao dar erro ao inserir no banco ObjectBox

          print("homeScreenEntity");
          print(homeScreenEntity.id);

          final box = await getBox();
          box.removeAll();
          box.put(homeScreenEntity);//Save in local database

          state.value = MainSuccessState(
            properties: components.map((component) {
              return SimpleProperties.fromJson(component as Map<String, dynamic>);
            }).toList(),
          );
        } else {
          state.value = MainErrorState(msg: 'Failed to load data');
        }

        ////////////////////////////////////////////////////////////////////////
        ///Carregando a tela com um arquivo json local
        ///
        ///OBS: Pode ser necessario alterar o SimpleProperties!
        ///
        // final jsonString = await DefaultAssetBundle.of(context).loadString('assets/dynamic.json');
        // final List<dynamic> jsonResponse = jsonDecode(jsonString);

        // state.value = MainSuccessState(
        //   properties: jsonResponse.map((properties) {
        //     return SimpleProperties.fromJson(properties);
        //   }).toList(),
        // );
        ////////////////////////////////////////////////////////////////////////
      }
    // } catch (error, stacktrace) {
    //   print("Error: ");
    //   print(error);
    //   print(stacktrace.toString());
    //   state.value = MainErrorState(msg: error.toString());
    // }
  }
}