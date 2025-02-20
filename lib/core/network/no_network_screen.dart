import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/config/app_text_styles.dart';

class NoNetworkScreen extends StatefulWidget {
  const NoNetworkScreen({super.key});

  @override
  State<NoNetworkScreen> createState() => _NoNetworkScreenState();
}

class _NoNetworkScreenState extends State<NoNetworkScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onRetry() async {
    // Open network settings
    await AppSettings.openAppSettingsPanel(
        AppSettingsPanelType.internetConnectivity);
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 8));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated icon
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.cyanBlueThemeColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.wifi_off_rounded,
                    size: 80,
                    color: AppColors.blueThemeColor,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Main heading
              Text(
                'No Internet Connection',
                style: AppTextStyles.descriptionHeadingstext,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Subheading
              Text(
                'Please check your network settings and try again',
                style: AppTextStyles.descriptionSubtext,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Retry button or loading indicator
              _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation(AppColors.blueThemeColor),
                      ),
                    )
                  : GestureDetector(
                      onTapDown: (_) {
                        setState(() {});
                      },
                      onTapUp: (_) {
                        _onRetry();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: AppColors.blueThemeColor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blueThemeColor
                                  .withValues(alpha: 0.4),
                              offset: const Offset(0, 6),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 13,
                        ),
                        child: Text(
                          'Try Again',
                          style: AppTextStyles.descriptionSubtext
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
