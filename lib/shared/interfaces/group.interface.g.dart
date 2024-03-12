// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskGroup _$TaskGroupFromJson(Map<String, dynamic> json) => TaskGroup(
      groupId: json['groupId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      metadata: (json['metadata'] as List<dynamic>?)
          ?.map((e) => MetaDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskGroupToJson(TaskGroup instance) {
  final val = <String, dynamic>{
    'groupId': instance.groupId,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('metadata', instance.metadata?.map((e) => e.toJson()).toList());
  return val;
}
