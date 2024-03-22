import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taskifie/app/route/app_router.dart';
import 'package:taskifie/modules/authentication/provider/signup.provider.dart';
import 'package:taskifie/shared/data/assets_paths.dart';
import 'package:taskifie/shared/data/theme.data.dart';
import 'package:taskifie/shared/widgets/buttons.dart';
import 'package:taskifie/shared/widgets/gradient_scaffold.dart';
import 'package:taskifie/shared/widgets/snackbar.dart';
import 'package:taskifie/shared/widgets/text_form_field.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key, this.onSignup});

  final ValueChanged<bool>? onSignup;

  @override
  Widget build(BuildContext context) {
    final SignupProvider signupProvider = context.read<SignupProvider>();
    return GradientScaffold(
      body: SingleChildScrollView(
        child: Form(
          key: signupProvider.signupFormKey,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 20,
              left: 24,
              right: 24,
              top: MediaQuery.of(context).size.height * 0.13,
            ),
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
                  "Create account",
                  style: AppTextStyle.subHeading1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 400,
                  child: Text(
                    "Register a new account by entering  you email and password",
                    style: AppTextStyle.body2,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: "Email",
                  hintText: "Enter your email address",
                  onSaved: (value) {
                    signupProvider.email = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                Consumer<SignupProvider>(
                  builder: (ctx, signupProvider, child) {
                    return CustomTextFormField(
                      label: "Password",
                      hintText: "Enter your password",
                      obscureText: !signupProvider.isPasswordVisible,
                      suffixIcon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: IconButton(
                          key: Key(signupProvider.isPasswordVisible.toString()),
                          icon: Icon(
                            !signupProvider.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () =>
                              signupProvider.togglePasswordEyeIcon(),
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
                        signupProvider.password = value!;
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
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Consumer<SignupProvider>(
                        builder: (ctx, signupProvider, child) {
                          return Checkbox(
                            value: signupProvider.isUserAgreedToTaC,
                            onChanged: (val) {
                              signupProvider.toggleUserAgreementToTaC();
                            },
                          );
                        },
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the terms of service',
                          style: AppTextStyle.body2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Consumer<SignupProvider>(
                    builder: (ctx, signupProvider, child) {
                      return PrimaryButton(
                        text: 'Continue',
                        onTap: () async {
                          signupProvider.toggleSignupButtonLoading();
                          bool isLogInSuccessful =
                              await signupProvider.submitSignupForm();
                          signupProvider.toggleSignupButtonLoading();
                          if (isLogInSuccessful) {
                            // ignore: use_build_context_synchronously
                            showSnackBar(
                              msg: 'Account created successfully',
                              type: ToastType.success,
                            );

                            // if (onLogin != null) {
                            //   onLogin!.call(isLogInSuccessful);
                            // } else {
                            //   // ignore: use_build_context_synchronously
                            //   await context.router.replaceAll(
                            //     [const AppLayoutRoute()],
                            //     updateExistingRoutes: false,
                            //   );
                            // }
                          }
                        },
                        contentAlignment: MainAxisAlignment.center,
                        loading: signupProvider.isSignupButtonLoading,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                // Text(
                //   'Or signup with',
                //   style: AppTextStyle.body2,
                // ),
                // const SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account?',
                    children: [
                      TextSpan(
                        text: ' try login.',
                        style: AppTextStyle.body2
                            .copyWith(color: AppColors.linkBlue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.router.replace(LoginRoute());
                          },
                      )
                    ],
                    style: AppTextStyle.body2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
