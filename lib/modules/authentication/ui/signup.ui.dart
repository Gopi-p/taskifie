import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taskifie/app/route/app_router.dart';
import 'package:taskifie/modules/authentication/provider/signup.provider.dart';
import 'package:taskifie/shared/data/assets_paths.dart';
import 'package:taskifie/shared/data/theme.data.dart';
import 'package:taskifie/shared/widgets/buttons.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key, this.onSignup});

  final ValueChanged<bool>? onSignup;

  @override
  Widget build(BuildContext context) {
    final SignupProvider signupProvider = context.read<SignupProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: signupProvider.signupFormKey,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 100,
              left: 24,
              right: 24,
              top: MediaQuery.of(context).size.height * 0.2,
            ),
            child: Center(
              child: SizedBox(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsPath.fullLogoColor,
                      width: 200,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Create an account",
                      style: AppTheme.displayXs,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.password_rounded),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (val) {
                            print("Checkbox : $val");
                          },
                        ),
                        const Text("I agree to the "),
                        PrimaryButton(
                          onTap: () {},
                          text: "Terms of service",
                          buttonType: ButtonType.link,
                        ),
                        const Text(" and "),
                        PrimaryButton(
                          onTap: () {},
                          text: "Privacy policies",
                          buttonType: ButtonType.link,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      text: 'Register',
                      onTap: () async {
                        await context.router.replaceAll(
                          [const AppLayoutRoute()],
                          updateExistingRoutes: false,
                        );
                      },
                      contentAlignment: MainAxisAlignment.center,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        PrimaryButton(
                          text: "Login",
                          onTap: () {
                            context.router.replace(const AppLayoutRoute());
                          },
                          buttonType: ButtonType.link,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
