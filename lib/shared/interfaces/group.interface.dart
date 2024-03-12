import 'package:json_annotation/json_annotation.dart';
import 'package:taskifie/shared/interfaces/task.interface.dart';

part 'group.interface.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
  explicitToJson: true,
  includeIfNull: false,
)
class TaskGroup {
  final String groupId;
  final String name;
  final String? description;
  final List<MetaDatum>? metadata;

  TaskGroup({
    required this.groupId,
    required this.name,
    this.description,
    this.metadata,
  });

  factory TaskGroup.fromJson(Map<String, dynamic> data) =>
      _$TaskGroupFromJson(data);
  Map<String, dynamic> toJson() => _$TaskGroupToJson(this);
}
