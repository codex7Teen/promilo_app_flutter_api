import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/config/app_text_styles.dart';
import 'package:promilo_flutter_app/shared/widgets/custom_auth_text_field.dart';
import 'package:promilo_flutter_app/shared/widgets/custom_blue_button.dart';

class LoginScreenWidgets {
  static PreferredSizeWidget buildAppbar() {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      centerTitle: true,
      title: Text('promilo', style: AppTextStyles.promiloText),
    );
  }

  static Widget buildWelcomeText() {
    return Center(
        child: Text(
      'Hi, Welcome Back!',
      style: AppTextStyles.mainHeadingText,
    ));
  }

  static Widget buildSignInText() {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Text(
        'Please Sign in to continue',
        style: AppTextStyles.textFieldsHeadingText,
      ),
    );
  }

  static Widget buildEmailField(TextEditingController emailController) {
    return CustomAuthTextField(
        hintText: 'Enter Email or Mob No.', controller: emailController);
  }

  static Widget buildSignInWithotpText() {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        'Sign In With OTP',
        style: AppTextStyles.blueColorButtonsText,
      ),
    );
  }

  static Widget buildPasswordText() {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Text(
        'Password',
        style: AppTextStyles.textFieldsHeadingText,
      ),
    );
  }

  static Widget buildPasswordInputField(
      TextEditingController passwordController) {
    return CustomAuthTextField(
        hintText: 'Enter Password', controller: passwordController);
  }

  static Widget buildRememberMeandForgotPasswordText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: AppColors.greyColor, width: 2.4)),
            ),
            Text('Remember Me', style: AppTextStyles.rememberMeText)
          ],
        ),
        Text(
          'Forget Password',
          style: AppTextStyles.blueColorButtonsText,
        ),
      ],
    );
  }

  static Widget buildSubmitButton() {
    return CustomBlueButton(buttonText: 'Submit');
  }

  static Widget buildOrDivider() {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Divider()),
        Text(
          'or',
          style: TextStyle(fontSize: 16),
        ),
        Expanded(child: Divider())
      ],
    );
  }

  static Widget buildSocialMediaIcons() {
    return Row(
      spacing: 18,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/google_logo-removebg-preview.png',
            width: 35),
        Image.asset('assets/images/LinkedIn_icon.svg-removebg-preview.png',
            width: 35),
        Image.asset('assets/images/Facebook_logo__square_-removebg-preview.png',
            width: 35),
        Image.asset('assets/images/Instagram_logo_2016-removebg-preview.png',
            width: 35),
        Image.asset('assets/images/whatsapp-removebg-preview.png', width: 35)
      ],
    );
  }

  static Widget buildUserAndDontHaveAccountText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Business User?', style: AppTextStyles.rememberMeText),
        Text("Don't have an account", style: AppTextStyles.rememberMeText)
      ],
    );
  }

  static Widget buildLoginAndSignupText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Login Here',
          style: AppTextStyles.blueColorButtonsText,
        ),
        Text(
          'Sign Up',
          style: AppTextStyles.blueColorButtonsText,
        ),
      ],
    );
  }

  static Widget builAgreeText() {
    return Center(
      child: Text('By continuing, you agree to',
          style: TextStyle(color: AppColors.greyColor)),
    );
  }

  static Widget buildAgreeSecondText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Promilo's ", style: TextStyle(color: AppColors.greyColor)),
        Text("Terms of Use & Privacy Policy")
      ],
    );
  }
}
