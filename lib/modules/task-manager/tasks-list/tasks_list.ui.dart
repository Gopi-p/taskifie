import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text("Tasks subject can be placed here"),
        );
      },
    );
  }
}
