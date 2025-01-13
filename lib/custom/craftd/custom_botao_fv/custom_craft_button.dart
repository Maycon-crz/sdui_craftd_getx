import 'package:craftd_widget/data/model/text/text_properties.dart';
import 'package:craftd_widget/presentation/ui/helper/craftd_colors.dart';
import 'package:craftd_widget/presentation/ui/text/craftd_text.dart';
import 'package:flutter/material.dart';
import 'package:sdui_craftd_getx/custom/craftd/custom_botao_fv/custom_craft_button_properties.dart';

class CustomCraftButton extends StatelessWidget {
final VoidCallback callback;
  final CustomCraftButtonProperties customCraftButtonProperties;

  const CustomCraftButton({ super.key, required this.callback, required this.customCraftButtonProperties, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(CraftDColor.hexToColor(customCraftButtonProperties.backgroundHex)),
      ),
      child: CraftDText(/*OBS: Nao usar esses componentes custom do CraftD criar seu proprio para nao ficar muito preso ao framework!*/
        textProperties: TextProperties(/*OBS: Nao usar esses componentes custom do CraftD criar seu proprio para nao ficar muito preso ao framework!*/
          text: customCraftButtonProperties.text,
          textColorHex: customCraftButtonProperties.textColorHex,
          textSize: customCraftButtonProperties.textSize,
          textAllCaps: customCraftButtonProperties.textAllCaps,
          /*backgroundHex: CustomCraftButtonProperties.backgroundHex,*/
        ),
      ),
    );
  }
}