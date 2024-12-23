
import 'package:get/get.dart';
import 'package:sdui_craftd_getx/api/rest_client.dart';

class HomeRepository {
  final RestClient _rest;

  HomeRepository({required RestClient rest}) : _rest = rest;

  Future<Response> loadPropertiesHomeUIRepository() async{
    return await _rest.get(
      "http://192.168.100.33/fv/server_driven_ui_php/index.php/produtos",
      headers: {
        'Content-Type': 'application/json',
      },
    ).then((value){
      return value;
    });
  }
}