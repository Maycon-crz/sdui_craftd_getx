import 'package:craftd_widget/data/model/action/action_properties.dart';
import 'package:craftd_widget/presentation/builder/craftd_builder.dart';
import 'package:craftd_widget/presentation/craftd_view_listener.dart';
import 'package:flutter/material.dart';
import 'package:sdui_craftd_getx/custom/craftd/custom_botao_fv/custom_craft_button.dart';
import 'package:sdui_craftd_getx/custom/craftd/custom_botao_fv/custom_craft_button_properties.dart';

class CustomCraftButtonBuilder extends CraftDBuilder<CustomCraftButtonProperties> {

  CustomCraftButtonBuilder(): super(key: keyBuilder);

  @override
  Widget craft(CustomCraftButtonProperties model, CraftDViewListener listener) {
    return CustomCraftButton(
      customCraftButtonProperties: model,
      callback: () {
        if (model.actionProperties != null) {
          listener(model.actionProperties!);
        }
      },
    );
  }

  @override
  CustomCraftButtonProperties fromJson(properties) {
    return CustomCraftButtonProperties(
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

  static String keyBuilder = "CustomCraftButton";

}