import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({
    @PathParam('taskId') required this.taskId,
    @PathParam('mode') required this.mode,
    super.key,
  });

  final String taskId;
  final String mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('TaskDetails page of $taskId : $mode'),
      ),
    );
  }
}
