import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskifie/shared/data/theme.data.dart';

@RoutePage()
class CustomBuildPage extends StatelessWidget {
  const CustomBuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: 270,
          decoration: const BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
          child: const Text(
            'data',
            style: TextStyle(
              color: AppColors.text,
            ),
          ),
        ),
      ),
    );
  }
}
