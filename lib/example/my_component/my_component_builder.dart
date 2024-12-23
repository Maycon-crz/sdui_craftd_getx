
import 'package:craftd_widget/craftd_widget.export.dart';
import 'package:craftd_widget/presentation/craftd_view_listener.dart';
import 'package:flutter/material.dart';
import 'package:sdui_craftd_getx/example/my_component/my_component.dart';
import 'package:sdui_craftd_getx/example/my_component/my_component_properties.dart';

class MyComponentBuilder extends CraftDBuilder<MyComponentProperties> {
  MyComponentBuilder() : super(key: keyBuilder);

  @override
  Widget craft(MyComponentProperties model, CraftDViewListener listener) {
    return MyComponent(
      properties: model, 
      callback: (){

      },
    );
  }

  @override
  MyComponentProperties fromJson(properties) {
    //Mapear todos ao atributos indivutualmente
    return MyComponentProperties(
      text: properties["text"]/* ["text"] = Nome da chave do Json */
    );
  }

  static String keyBuilder = "MyComponent";
  /* 
    Esse keyBuilder e a key do componente no json EX:
    {
      "key": "CraftDButton",
      "value": {
        ...
      }
    }
  */
  
}