import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskifie/shared/services/general.service.dart';

@RoutePage()
class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    GeneralService.o.setInitialContext(context);
    return const AutoRouter();
  }
}
