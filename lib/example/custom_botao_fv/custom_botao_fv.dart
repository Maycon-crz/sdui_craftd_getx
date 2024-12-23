import 'package:craftd_widget/data/model/text/text_properties.dart';
import 'package:craftd_widget/presentation/ui/helper/craftd_colors.dart';
import 'package:craftd_widget/presentation/ui/text/craftd_text.dart';
import 'package:flutter/material.dart';
import 'package:sdui_craftd_getx/example/custom_botao_fv/custom_botao_fv_properties.dart';

class CustomBotaoFV extends StatelessWidget {
final VoidCallback callback;
  final CustomBotaoFvProperties customBotaoFvProperties;

  const CustomBotaoFV({ super.key, required this.callback, required this.customBotaoFvProperties, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(CraftDColor.hexToColor(customBotaoFvProperties.backgroundHex)),
      ),
      child: CraftDText(/*OBS: Nao usar esses componentes custom do CraftD criar seu proprio para nao ficar muito preso ao framework!*/
        textProperties: TextProperties(/*OBS: Nao usar esses componentes custom do CraftD criar seu proprio para nao ficar muito preso ao framework!*/
          text: customBotaoFvProperties.text,
          textColorHex: customBotaoFvProperties.textColorHex,
          textSize: customBotaoFvProperties.textSize,
          textAllCaps: customBotaoFvProperties.textAllCaps,
          /*backgroundHex: customBotaoFvProperties.backgroundHex,*/
        ),
      ),
    );
  }
}