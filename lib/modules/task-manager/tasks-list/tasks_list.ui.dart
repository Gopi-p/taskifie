import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskifie/app/route/app_router.dart';

@RoutePage()
class TasksListPage extends StatelessWidget {
  const TasksListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("($index) Tasks subject can be placed here"),
          onTap: () {
            context.router
                .push(TaskDetailsRoute(taskId: index.toString(), mode: 'edit'));
          },
          trailing: const Icon(Icons.arrow_right),
        );
      },
    );
  }
}
