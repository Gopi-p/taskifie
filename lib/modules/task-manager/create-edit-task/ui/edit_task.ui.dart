import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('CreateEditTask page'),
      ),
    );
  }
}
