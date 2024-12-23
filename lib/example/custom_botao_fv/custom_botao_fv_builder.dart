import 'package:craftd_widget/data/model/action/action_properties.dart';
import 'package:craftd_widget/presentation/builder/craftd_builder.dart';
import 'package:craftd_widget/presentation/craftd_view_listener.dart';
import 'package:flutter/material.dart';
import 'package:sdui_craftd_getx/example/custom_botao_fv/custom_botao_fv.dart';
import 'package:sdui_craftd_getx/example/custom_botao_fv/custom_botao_fv_properties.dart';

class CustomBotaoFVBuilder extends CraftDBuilder<CustomBotaoFvProperties> {

  CustomBotaoFVBuilder(): super(key: keyBuilder);

  @override
  Widget craft(CustomBotaoFvProperties model, CraftDViewListener listener) {
    return CustomBotaoFV(
      customBotaoFvProperties: model,
      callback: () {
        if (model.actionProperties != null) {
          listener(model.actionProperties!);
        }
      },
    );
  }

  @override
  CustomBotaoFvProperties fromJson(properties) {
    return CustomBotaoFvProperties(
      text: properties["text"],
      textColorHex: properties["textColorHex"],
      textSize: properties["textSize"],
      textAllCaps: properties["textAllCaps"],
      fillMaxSize: properties["fillMaxSize"],
      backgroundHex: properties["backgroundHex"],
      actionProperties: ActionProperties.fromJson(
        properties[ActionProperties.key],
      ),
    );
  }

  static String keyBuilder = "CustomBotaoFV";

}