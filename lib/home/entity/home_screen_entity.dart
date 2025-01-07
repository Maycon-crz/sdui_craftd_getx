import 'dart:convert';

import 'package:objectbox/objectbox.dart';
import 'package:sdui_craftd_getx/home/entity/component_dto.dart';

@Entity()
class HomeScreenEntity {
  @Id()
  int? id;
  String? name;
  String? description;
  String? components;
  bool? toUpdate;

  HomeScreenEntity({
    this.id = 0, 
    this.name, 
    this.description, 
    this.components, 
    this.toUpdate = true,
  });

  factory HomeScreenEntity.fromJson(Map<String, dynamic> json) {
    var componentsJson = json['components'] as List<dynamic>;
    List<ComponentDTO> componentsList = componentsJson.map((componentJson) => ComponentDTO.fromJson(componentJson as Map<String, dynamic>)).toList();

    List<Map<String, dynamic>> jsonListComponents = componentsList.map((component) => component.toJson()).toList();
    return HomeScreenEntity(
      id: json['id'] ?? 0,
      name: json['nome'] as String?,
      description: json['descricao'] as String?,
      // components: componentsList,
      components: jsonEncode(componentsList.map((component) => component.toJson()).toList()),
      toUpdate: json['toUpdate'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      // 'components': components?.map((component) => component.toJson()).toList(),
      'components': components,
      'toUpdate': toUpdate,
    };
  }
}