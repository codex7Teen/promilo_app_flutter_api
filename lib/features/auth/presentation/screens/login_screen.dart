import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/features/auth/presentation/widgets/login_screen_widgets.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! APPBAR
      appBar: LoginScreenWidgets.buildAppbar(),
      backgroundColor: AppColors.whiteColor,
      //! BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! WELCOME TEXT
              LoginScreenWidgets.buildWelcomeText(),
              SizedBox(height: 34),
              //! SIGN IN TEXT
              LoginScreenWidgets.buildSignInText(),
              SizedBox(height: 6),
              //! EMAIL INPUT FIELD
              LoginScreenWidgets.buildEmailField(_emailController),
              SizedBox(height: 6),
              //! SIGN IN WITH OTP TEXT
              LoginScreenWidgets.buildSignInWithotpText(),
              SizedBox(height: 10),
              //! PASSWORD TEXT
              LoginScreenWidgets.buildPasswordText(),
              SizedBox(height: 6),
              //! PASSWORD INPUT FIELD
              LoginScreenWidgets.buildPasswordInputField(_passwordController),
              SizedBox(height: 10),
              //! REMEMBER ME & FORGOT PASSWORD TEXT
              LoginScreenWidgets.buildRememberMeandForgotPasswordText(),
              SizedBox(height: 30),
              //! SUBMIT BUTTON
              LoginScreenWidgets.buildSubmitButton(),
              SizedBox(height: 26),
              //! OR DIVIDER
              LoginScreenWidgets.buildOrDivider(),
              SizedBox(height: 26),
              //! SOCIAL MEDIA ICONS
              LoginScreenWidgets.buildSocialMediaIcons(),
              SizedBox(height: 28),
              //! BUSINESS USER & DONT HAVE ACCOUNT TEXT
              LoginScreenWidgets.buildUserAndDontHaveAccountText(),
              SizedBox(height: 2),
              //! LOGIN & SIGNUP TEXT
              LoginScreenWidgets.buildLoginAndSignupText(),
              SizedBox(height: 28),

              LoginScreenWidgets.builAgreeText(),
              LoginScreenWidgets.buildAgreeSecondText()
            ],
          ),
        ),
      ),
    );
  }
}
