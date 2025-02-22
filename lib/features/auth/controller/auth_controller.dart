import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:promilo_flutter_app/core/navigation/main_bottom_navigaton.dart';
import 'package:promilo_flutter_app/core/network/internet_connection_wrapper.dart';
import 'package:promilo_flutter_app/data/models/login_model.dart';
import 'package:promilo_flutter_app/data/services/auth_services.dart';

//! AUTH CONTROLLER
class AuthController extends GetxController {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observables to track text changes
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool isButtonEnabled = false.obs;
  RxBool isLoading = false.obs;

  // Regular expression for email validation
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  //! ONINIT
  @override
  void onInit() {
    super.onInit();
    ever(email, (_) => checkButtonState());
    ever(password, (_) => checkButtonState());
  }

  //! SUBMIT BUTTON VISIBILITY CONTROL FUNCTIONS
  void updateEmail(String value) {
    email.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  // Check if email format is valid
  bool isEmailValid() {
    return emailRegex.hasMatch(email.value.trim());
  }

  void checkButtonState() {
    isButtonEnabled.value = isEmailValid() && password.value.trim().isNotEmpty;
  }

  //! LOGIN FUNCTION
  Future<void> loginUser() async {
    isLoading.value = true;
    try {
      LoginModel? loginResponse =
          await AuthServices.loginUser(email.value, password.value);
      isLoading.value = false;

      if (loginResponse != null) {
        // Save access-token securely
        await _secureStorage.write(
            key: "access_token", value: loginResponse.accessToken);
        log('CONTROL: TOKEN SAVE SUCCESS. TOKEN: ${loginResponse.accessToken}');

        // Navigate to home screen on login success
        Get.offAll(
            () => InternetConnectionWrapper(child: MainBottomNavigation()),
            transition: Transition.fadeIn);
        Get.snackbar("Login Success", "Successfully Logged In... 🎉🎉🎉",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else {
        showErrorSnackbar("Invalid email or password");
      }
    } catch (error) {
      isLoading.value = false;
      showErrorSnackbar(error.toString());
    }
  }

  void showErrorSnackbar(String message) {
    Get.snackbar("Login Error", message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  }

  //! ONCLOSE
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
