import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/navigation/main_bottom_navigaton.dart';
import 'package:promilo_flutter_app/features/auth/presentation/screens/login_screen.dart';
import 'package:promilo_flutter_app/features/home/presentation/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final secureStorage = FlutterSecureStorage();
  // read accesstoken from secure storage
  final token = await secureStorage.read(key: "access_token");
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  // Bool to check accesstoken is null or not
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Promilo_Flutter_App',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.darkBlueThemeColor),
          useMaterial3: true,
        ),
        home: isLoggedIn ? MainBottomNavigaton() : ScreenLogin());
  }
}
