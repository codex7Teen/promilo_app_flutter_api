import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/config/app_text_styles.dart';
import 'package:promilo_flutter_app/shared/widgets/custom_auth_text_field.dart';
import 'package:promilo_flutter_app/shared/widgets/custom_blue_button.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! APPBAR
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text('promilo', style: AppTextStyles.promiloText),
      ),
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
              Center(
                  child: Text(
                'Hi, Welcome Back!',
                style: AppTextStyles.mainHeadingText,
              )),
              SizedBox(height: 34),
              //! SIGN IN TEXT
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  'Please Sign in to continue',
                  style: AppTextStyles.textFieldsHeadingText,
                ),
              ),
              SizedBox(height: 6),
              //! EMAIL INPUT FIELD
              CustomAuthTextField(
                  hintText: 'Enter Email or Mob No.',
                  controller: _emailController),
              SizedBox(height: 6),
              //! SIGN IN WITH OTP TEXT
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Sign In With OTP',
                  style: AppTextStyles.blueColorButtonsText,
                ),
              ),
              SizedBox(height: 10),

              //! PASSWORD TEXT
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  'Password',
                  style: AppTextStyles.textFieldsHeadingText,
                ),
              ),
              SizedBox(height: 6),
              //! PASSWORD INPUT FIELD
              CustomAuthTextField(
                  hintText: 'Enter Password', controller: _passwordController),
              SizedBox(height: 10),
              //! REMEMBER ME & FORGOT PASSWORD TEXT
              Row(
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
                            border: Border.all(
                                color: AppColors.greyColor, width: 2.4)),
                      ),
                      Text('Remember Me', style: AppTextStyles.rememberMeText)
                    ],
                  ),
                  Text(
                    'Forget Password',
                    style: AppTextStyles.blueColorButtonsText,
                  ),
                ],
              ),
              SizedBox(height: 30),
              //! SUBMIT BUTTON
              CustomBlueButton(buttonText: 'Submit'),
              SizedBox(height: 26),
              //! OR DIVIDER
              Row(
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
              ),
              SizedBox(height: 26),
              //! SOCIAL MEDIA ICONS
              Row(
                spacing: 18,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/google_logo-removebg-preview.png',
                      width: 35),
                  Image.asset(
                      'assets/images/LinkedIn_icon.svg-removebg-preview.png',
                      width: 35),
                  Image.asset(
                      'assets/images/Facebook_logo__square_-removebg-preview.png',
                      width: 35),
                  Image.asset(
                      'assets/images/Instagram_logo_2016-removebg-preview.png',
                      width: 35),
                  Image.asset('assets/images/whatsapp-removebg-preview.png',
                      width: 35)
                ],
              ),
              SizedBox(height: 28),
              //! BUSINESS USER & DONT HAVE ACCOUNT TEXT
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Business User?', style: AppTextStyles.rememberMeText),
                  Text("Don't have an account",
                      style: AppTextStyles.rememberMeText)
                ],
              ),
              SizedBox(height: 2),
              //! LOGIN & SIGNUP TEXT
              Row(
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
              ),
              SizedBox(height: 28),

              Center(
                child: Text('By continuing, you agree to',
                    style: TextStyle(color: AppColors.greyColor)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Promilo's ",
                      style: TextStyle(color: AppColors.greyColor)),
                  Text("Terms of Use & Privacy Policy")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
