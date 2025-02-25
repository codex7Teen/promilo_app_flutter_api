import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/navigation/screen_sample.dart';
import 'package:promilo_flutter_app/features/home/presentation/screen/home_screen.dart';

class MainBottomNavigation extends StatefulWidget {
  const MainBottomNavigation({super.key});

  @override
  State<MainBottomNavigation> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);

  List<Widget> _buildScreens() {
    return [
      ScrrenSample(),
      // Container(color: Colors.red), // Placeholder for Prolet screen
      Container(color: Colors.green), // Placeholder for Meetup screen
      ScreenHome(),
      Container(color: Colors.blue), // Placeholder for Explore screen
      Container(color: Colors.purple), // Placeholder for Account screen
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    List<String> navBarImages = [
      'assets/images/home_icon.png',
      'assets/images/category.png',
      'assets/images/agree_icon.png',
      'assets/images/file_search.png',
      'assets/images/user_icon.png'
    ];

    List<String> labels = ['Home', 'Prolet', 'Meetup', 'Explore', 'Account'];

    return List.generate(navBarImages.length, (index) {
      return PersistentBottomNavBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            Image.asset(navBarImages[index], width: 28, height: 28),
          ],
        ),
        textStyle: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, height: 1.8),
        title: labels[index],
        activeColorPrimary: AppColors.cyanBlueThemeColor,
        inactiveColorPrimary: AppColors.blackColor,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: kBottomNavigationBarHeight * 1.40,
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: AppColors.whiteColor,
      navBarStyle: NavBarStyle.simple,
    );
  }
}
