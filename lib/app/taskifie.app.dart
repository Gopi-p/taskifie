import 'package:flutter/material.dart';
import 'package:taskifie/app/route/app_router.dart';
import 'package:taskifie/shared/data/app_details.data.dart';
import 'package:taskifie/shared/functions/theme.function.dart';

class Taskifie extends StatelessWidget {
  Taskifie({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppDetails.name,
      theme: getAppThemeData(),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
