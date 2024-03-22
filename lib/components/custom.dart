import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskifie/shared/data/theme.data.dart';
import 'package:taskifie/shared/widgets/buttons.dart';
import 'package:taskifie/shared/widgets/text_form_field.dart';

@RoutePage()
class CustomBuildPage extends StatelessWidget {
  const CustomBuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
