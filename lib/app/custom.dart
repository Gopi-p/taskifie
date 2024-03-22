import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskifie/shared/widgets/buttons.dart';

@RoutePage()
class CustomBuildPage extends StatelessWidget {
  const CustomBuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom page for testing'),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: SizedBox(
          width: 300,
          child: PrimaryButton(text: 'text', onTap: () {}),
        ),
      ),
    );
  }
}
