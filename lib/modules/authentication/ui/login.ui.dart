import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taskifie/app/route/app_router.dart';
import 'package:taskifie/modules/authentication/provider/login.provider.dart';
import 'package:taskifie/shared/data/assets_paths.dart';
import 'package:taskifie/shared/data/typography.data.dart';
import 'package:taskifie/shared/widgets/buttons.dart';
import 'package:taskifie/shared/widgets/snackbar.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginProvider loginProvider = context.read<LoginProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: loginProvider.loginFormKey,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 100,
              left: 24,
              right: 24,
              top: MediaQuery.of(context).size.height * 0.2,
            ),
            child: Center(
              child: SizedBox(
                width: 372,
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
                      "Log in to your account",
                      style: TextStyles.displayXs,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Welcome back! Please enter your details.",
                      textAlign: TextAlign.center,
                      style: TextStyles.textXs,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email),
                      ),
                      onSaved: (value) {
                        loginProvider.email = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Consumer<LoginProvider>(
                        builder: (ctx, loginProvider, child) {
                      return TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text("Password"),
                          prefixIcon: const Icon(Icons.password_rounded),
                          suffixIcon: IconButton(
                            icon: Icon(
                              !loginProvider.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              loginProvider.togglePasswordEyeIcon();
                            },
                          ),
                        ),
                        obscureText: !loginProvider.isPasswordVisible,
                        onSaved: (value) {
                          loginProvider.password = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      );
                    }),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      contentAlignment: MainAxisAlignment.end,
                      onTap: () {},
                      text: "Forgot password?",
                      buttonType: ButtonType.link,
                    ),
                    const SizedBox(height: 24),
                    Consumer<LoginProvider>(
                        builder: (ctx, loginProvider, child) {
                      return PrimaryButton(
                        text: 'Login',
                        onTap: () async {
                          // loginProvider.toggleLoginButtonLoading();
                          // bool isLogInSuccessful =
                          //     await loginProvider.submitLoginForm();
                          // loginProvider.toggleLoginButtonLoading();
                          // if (isLogInSuccessful) {
                          //   // ignore: use_build_context_synchronously
                          //   showSnackBar(
                          //     msg: 'Login successful',
                          //     type: ToastType.success,
                          //   );

                          //   // ignore: use_build_context_synchronously
                          context.router.replaceAll([const HomeRoute()]);
                          // }
                        },
                        contentAlignment: MainAxisAlignment.center,
                        loading: loginProvider.isLoginButtonLoading,
                      );
                    }),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account? "),
                        PrimaryButton(
                          text: "Sign up",
                          onTap: () {
                            context.router.replace(const SignUpRoute());
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
