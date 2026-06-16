import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/core/routes/route_name.dart';

import '../../../core/resources/constant/color_manager.dart';
import '../../../core/resources/constant/image_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.onboardingScreen,
          (predicate) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND IMAGE
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageManager.background),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// CONTENT
          SafeArea(
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// APP NAME
                          Text(
                            "Learnify",
                            style: TextStyle(
                              fontSize: 52.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,

                              foreground: Paint()
                                ..shader = ColorManager.primaryGradient
                                    .createShader(
                                      Rect.fromLTWH(0, 0, 250.w, 80.h),
                                    ),

                              shadows: const [
                                Shadow(
                                  blurRadius: 12,
                                  color: Color(0x4D000000),
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 8.h),

                          Text(
                            "Scan. Understand. Learn.",
                            style: const TextStyle(
                              color: Color(0xBFFFFFFF),
                              fontSize: 14,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
