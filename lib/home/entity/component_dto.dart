class ComponentDTO {
  String key;
  Map<String, dynamic> value;

  ComponentDTO({required this.key, required this.value});

  factory ComponentDTO.fromJson(Map<String, dynamic> json) {
    return ComponentDTO(
      key: json['key'] as String,
      value: json['value'] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value,
    };
  }
}