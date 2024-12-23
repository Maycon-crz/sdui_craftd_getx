
import 'package:craftd_widget/data/model/action/action_properties.dart';

class CustomBotaoFvProperties/*dto*/ {
  const CustomBotaoFvProperties({
    required this.text,
    this.textColorHex,
    this.textSize,
    this.textAllCaps,
    this.fillMaxSize,
    this.backgroundHex,
    this.actionProperties
  
  });

  final String text;
  final String? textColorHex;
  final String? textSize;
  final bool? textAllCaps;
  final bool? fillMaxSize;
  final String? backgroundHex;
  final ActionProperties? actionProperties;
}