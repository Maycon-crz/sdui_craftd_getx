import 'package:flutter/material.dart';
import 'package:sdui_craftd_getx/custom/craftd/my_component/my_component_properties.dart';

class MyComponent extends StatelessWidget {
  final VoidCallback callback;
  final MyComponentProperties properties;

  const MyComponent({ 
    super.key, 
    required this.properties, 
    required this.callback,
  });

   @override
   Widget build(BuildContext context) {
       return Text(properties.text ?? "Empty");
  }
}