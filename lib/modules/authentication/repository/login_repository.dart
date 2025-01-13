import 'dart:convert';

import 'package:get/get.dart';
import 'package:sdui_craftd_getx/api/api_path.dart';
import 'package:sdui_craftd_getx/api/rest_client.dart';
import 'package:sdui_craftd_getx/modules/authentication/dto/login_dto.dart';
import 'package:sdui_craftd_getx/modules/authentication/repository/auth.dart';
// import 'package:login_flutter/app/modules/models/authenticationModel/dataTransferObjects/login_dto.dart';
// import 'package:login_flutter/app/modules/repository/authenticationRepository/auth.dart';
// import 'package:login_flutter/app/routes/api/api_path.dart';
// import 'package:login_flutter/app/shared/rest_client.dart';

class LoginRepository extends Auth {
  final RestClient restClient;
  LoginRepository(this.restClient);
  LoginDTO loginResponseDTO = LoginDTO();
  Future<LoginDTO?> loginRequest(LoginDTO dataLoginDTO) async {
    String url = "${ApiPath.base}login";
    final body = jsonEncode({
      'email': dataLoginDTO.email,
      'password': dataLoginDTO.pass,
      'front_end': 'external',
      'app_key': super.getAppKey,
    });
    
    Response? response = await restClient.post(
      url,
      body,
      headers: {
        'Charset': 'utf-8',
        'Content-Type': 'application/json',
      },
    );
    
    print(response.body);
    if (response.body["status"] == "success") {
        loginResponseDTO = LoginDTO.fromMap(response.body["data"]);
        loginResponseDTO.status = response.body["status"];
        print("loginResponseDTO:");
        print(loginResponseDTO);
        return loginResponseDTO;
    }
    return null;
  }
}
