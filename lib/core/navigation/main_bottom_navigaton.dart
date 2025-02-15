import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/features/home/presentation/screen/home_screen.dart';

class MainBottomNavigaton extends StatelessWidget {
  const MainBottomNavigaton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[0],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.cyanBlueThemeColor,
          unselectedItemColor: AppColors.blackColor,
          currentIndex: 2,
          items: [
            navbarItem[0],
            navbarItem[1],
            navbarItem[2],
            navbarItem[3],
            navbarItem[4]
          ]),
    );
  }

  // screens list
  static List<Widget> screens = [ScreenHome()];

  // bottom navbar images
  static const List<String> navBarImages = [
    'assets/images/home_icon.png',
    'assets/images/category.png',
    'assets/images/agree_icon.png',
    'assets/images/file_search.png',
    'assets/images/user_icon.png'
  ];

  // navbar items list
  static List<BottomNavigationBarItem> navbarItem = [
    BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4, top: 4),
          child: Image.asset(
            navBarImages[0],
            width: 28,
          ),
        ),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4, top: 4),
          child: Image.asset(
            navBarImages[1],
            width: 28,
          ),
        ),
        label: 'Prolet'),
    BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4, top: 4),
          child: Image.asset(
            navBarImages[2],
            width: 28,
          ),
        ),
        label: 'Meetup'),
    BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4, top: 4),
          child: Image.asset(
            navBarImages[3],
            width: 28,
          ),
        ),
        label: 'Explore'),
    BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4, top: 4),
          child: Image.asset(
            navBarImages[0],
            width: 28,
          ),
        ),
        label: 'Account'),
  ];
}
