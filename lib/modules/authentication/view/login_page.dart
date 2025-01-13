import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdui_craftd_getx/custom/app_bar_component.dart';
import 'package:sdui_craftd_getx/custom/text_form_field_component.dart';
import 'package:sdui_craftd_getx/modules/authentication/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: customAppBar(title: "Iniciar sessão"),
      body: Card(
        margin: const EdgeInsets.all(10),
        elevation: 130,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_circle, size: 230),
                const SizedBox(height: 30),
                textFormFieldComponent(
                  context: context,
                  controller: controller.emailController.value,
                  label: "E-mail",
                  type: "email",
                ),
                const SizedBox(height: 10),
                textFormFieldComponent(
                  context: context,
                  controller: controller.passwordController.value,
                  label: "Senha",
                  pass: true,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(!controller.isLoadingLogin.value
                      ? "Entrar"
                      : "Carregando..."),
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        !controller.isLoadingLogin.value) {
                      controller.login();
                    }
                  },
                ),
                const SizedBox(height: 10),
                // ElevatedButton(
                //   child: const Text("Cadastre-se"),
                //   onPressed: () {
                //     Get.toNamed(RouteName.userRegistration);
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
