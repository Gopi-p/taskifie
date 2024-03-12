import 'package:json_annotation/json_annotation.dart';
part 'task.interface.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
  explicitToJson: true,
  includeIfNull: false,
)
class Task {
  final String taskId;
  final String task;
  final DateTime? due;
  final List<String>? files;
  final String? priority;
  final String? status;
  final bool? deleted;
  final String? group;
  final bool? myDay;
  final String? notes;
  final List<MetaDatum>? metadata;

  Task({
    required this.taskId,
    required this.task,
    this.due,
    this.files,
    this.priority,
    this.status,
    this.deleted,
    this.group,
    this.myDay,
    this.notes,
    this.metadata,
  });

  factory Task.fromJson(Map<String, dynamic> data) => _$TaskFromJson(data);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable(
  createFactory: true,
  createToJson: true,
  explicitToJson: true,
  includeIfNull: false,
)
class MetaDatum {
  final String type;
  final DateTime at;
  final String by;

  MetaDatum({
    required this.type,
    required this.at,
    required this.by,
  });

  factory MetaDatum.fromJson(Map<String, dynamic> data) =>
      _$MetaDatumFromJson(data);
  Map<String, dynamic> toJson() => _$MetaDatumToJson(this);
}
