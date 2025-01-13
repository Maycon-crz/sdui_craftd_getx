
import 'package:get/get.dart';
import 'package:sdui_craftd_getx/api/api_path.dart';
import 'package:sdui_craftd_getx/api/rest_client.dart';

class HomeRepository {
  final RestClient _rest;

  HomeRepository({
    required RestClient rest,
  }) : _rest = rest;

  Future<Response> loadPropertiesHomeUIRepository() async{
    print("Chegou aqui");
    return await _rest.get(
      "${ApiPath.base}index.php/tela/1",
      headers: {
        'Content-Type': 'application/json',
      },
    ).then((value){
      print(value);
      return value;
    });
  }
}