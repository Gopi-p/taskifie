// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      taskId: json['taskId'] as String,
      task: json['task'] as String,
      due: json['due'] == null ? null : DateTime.parse(json['due'] as String),
      files:
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toList(),
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      deleted: json['deleted'] as bool?,
      group: json['group'] as String?,
      myDay: json['myDay'] as bool?,
      notes: json['notes'] as String?,
      metadata: (json['metadata'] as List<dynamic>?)
          ?.map((e) => MetaDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskToJson(Task instance) {
  final val = <String, dynamic>{
    'taskId': instance.taskId,
    'task': instance.task,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('due', instance.due?.toIso8601String());
  writeNotNull('files', instance.files);
  writeNotNull('priority', instance.priority);
  writeNotNull('status', instance.status);
  writeNotNull('deleted', instance.deleted);
  writeNotNull('group', instance.group);
  writeNotNull('myDay', instance.myDay);
  writeNotNull('notes', instance.notes);
  writeNotNull('metadata', instance.metadata?.map((e) => e.toJson()).toList());
  return val;
}

MetaDatum _$MetaDatumFromJson(Map<String, dynamic> json) => MetaDatum(
      type: json['type'] as String,
      at: DateTime.parse(json['at'] as String),
      by: json['by'] as String,
    );

Map<String, dynamic> _$MetaDatumToJson(MetaDatum instance) => <String, dynamic>{
      'type': instance.type,
      'at': instance.at.toIso8601String(),
      'by': instance.by,
    };
