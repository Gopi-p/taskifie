import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskifie/app/route/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Home page'),
          ElevatedButton(
            onPressed: () {
              context.router.push(const LoginRoute());
            },
            child: const Text('Go to login'),
          )
        ],
      ),
    );
  }
}
