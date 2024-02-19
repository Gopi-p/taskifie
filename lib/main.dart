import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskifie/app/taskifie.app.dart';
import 'package:taskifie/modules/authentication/provider/login.provider.dart';
import 'package:taskifie/modules/authentication/provider/signup.provider.dart';
import 'package:taskifie/modules/home/provider/home.provider.dart';
import 'package:taskifie/shared/services/startup.service.dart';

Future<void> main() async {
  await StartUpService.o.initAppBeforeAuth();
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: Taskifie(),
    );
  }
}
