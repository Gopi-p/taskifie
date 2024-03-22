import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taskifie/app/route/app_router.dart';
import 'package:taskifie/modules/authentication/provider/login.provider.dart';
import 'package:taskifie/shared/data/assets_paths.dart';
import 'package:taskifie/shared/data/theme.data.dart';
import 'package:taskifie/shared/widgets/buttons.dart';
import 'package:taskifie/shared/widgets/gradient_scaffold.dart';
import 'package:taskifie/shared/widgets/snackbar.dart';
import 'package:taskifie/shared/widgets/text_form_field.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.onLogin});

  final ValueChanged<bool>? onLogin;

  @override
  Widget build(BuildContext context) {
    final LoginProvider loginProvider = context.read<LoginProvider>();
    return GradientScaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 20,
              left: 24,
              right: 24,
              top: MediaQuery.of(context).size.height * 0.13,
            ),
            child: SizedBox(
              width: 372,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (rect) =>
                        AppTheme.secondaryGradient.createShader(rect),
                    child: SvgPicture.asset(
                      AssetsPath.fullLogoWhite,
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    "Welcome back",
                    style: AppTextStyle.subHeading1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Log in with your email address and password",
                    style: AppTextStyle.body2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    label: "Email",
                    hintText: "Enter your email address",
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
                  const SizedBox(height: 18),
                  Consumer<LoginProvider>(
                    builder: (ctx, loginProvider, child) {
                      return CustomTextFormField(
                        label: "Password",
                        hintText: "Enter your password",
                        obscureText: !loginProvider.isPasswordVisible,
                        suffixIcon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: IconButton(
                            key:
                                Key(loginProvider.isPasswordVisible.toString()),
                            icon: Icon(
                              !loginProvider.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () =>
                                loginProvider.togglePasswordEyeIcon(),
                          ),
                          transitionBuilder: (
                            Widget child,
                            Animation<double> animation,
                          ) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                        ),
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
                    },
                  ),
                  const SizedBox(height: 18),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 372),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Consumer<LoginProvider>(
                          builder: (ctx, loginProvider, child) {
                            return Checkbox(
                              value: loginProvider.isRememberMe,
                              onChanged: (val) {
                                loginProvider.toggleRememberMe();
                              },
                            );
                          },
                        ),
                        Text(
                          'Stay logged in',
                          style: AppTextStyle.body2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 372),
                    child: Consumer<LoginProvider>(
                      builder: (ctx, loginProvider, child) {
                        return PrimaryButton(
                          text: 'Login',
                          onTap: () async {
                            loginProvider.toggleLoginButtonLoading();
                            bool isLogInSuccessful =
                                await loginProvider.submitLoginForm();
                            loginProvider.toggleLoginButtonLoading();
                            if (isLogInSuccessful) {
                              // ignore: use_build_context_synchronously
                              showSnackBar(
                                msg: 'Login successful',
                                type: ToastType.success,
                              );

                              if (onLogin != null) {
                                onLogin!.call(isLogInSuccessful);
                              } else {
                                // ignore: use_build_context_synchronously
                                await context.router.replaceAll(
                                  [const AppLayoutRoute()],
                                  updateExistingRoutes: false,
                                );
                              }
                            }
                          },
                          contentAlignment: MainAxisAlignment.center,
                          loading: loginProvider.isLoginButtonLoading,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  PrimaryButton(
                    onTap: () {},
                    text: "Forgot password?",
                    contentAlignment: MainAxisAlignment.center,
                    buttonType: ButtonType.link,
                  ),
                  const SizedBox(height: 15),
                  // Text(
                  //   'Or login with',
                  //   style: AppTextStyle.body2,
                  // ),
                  // const SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      text: 'Don’t have an account?',
                      children: [
                        TextSpan(
                          text: ' create one.',
                          style: AppTextStyle.body2
                              .copyWith(color: AppColors.linkBlue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.router.replace(SignUpRoute());
                            },
                        )
                      ],
                      style: AppTextStyle.body2,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
