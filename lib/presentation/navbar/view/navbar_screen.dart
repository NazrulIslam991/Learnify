import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/core/resources/constant/color_manager.dart';

import '../../home/view/home_screen.dart';
import '../../library/view/library_screen.dart';
import '../../scan/view/scan_screen.dart';
import '../../setting/view/setting_screen.dart';
import '../viewmodel/navbar_viewmodel.dart';

class NavbarScreen extends ConsumerWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navbarProvider);

    final List<Widget> screens = [
      const HomeScreen(),
      const LibraryScreen(),
      const ScanScreen(),
      const HomeScreen(),
      const SettingScreen(),
    ];

    return Scaffold(
      backgroundColor: ColorManager.black6,
      extendBody: true,
      body: screens[currentIndex],

      floatingActionButton: _buildScanButton(ref, currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(ref, currentIndex),
    );
  }

  Widget _buildScanButton(WidgetRef ref, int currentIndex) {
    return Container(
      height: 60.r,
      width: 60.r,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: ColorManager.black6,
        shape: BoxShape.circle,
        border: currentIndex == 2
            ? Border.all(color: ColorManager.white, width: 2.w)
            : null,
      ),
      child: FloatingActionButton(
        onPressed: () => ref.read(navbarProvider.notifier).setIndex(2),
        backgroundColor: currentIndex == 2
            ? ColorManager.white
            : ColorManager.purpleShade,
        shape: const CircleBorder(),
        child: Icon(
          Icons.qr_code_scanner,
          color: currentIndex == 2 ? ColorManager.purpleShade : Colors.white,
          size: 28.sp,
        ),
      ),
    );
  }

  Widget _buildBottomAppBar(WidgetRef ref, int currentIndex) {
    return BottomAppBar(
      color: ColorManager.navbar,
      height: 75.h,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(ref, Icons.home_filled, "Home", 0, currentIndex),
          _buildNavItem(ref, Icons.library_books, "Library", 1, currentIndex),
          SizedBox(width: 50.w),
          _buildNavItem(ref, Icons.smart_toy, "EduBot", 3, currentIndex),
          _buildNavItem(
            ref,
            Icons.settings_outlined,
            "Settings",
            4,
            currentIndex,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    WidgetRef ref,
    IconData icon,
    String label,
    int index,
    int currentIndex,
  ) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => ref.read(navbarProvider.notifier).setIndex(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManager.white.withAlpha(30)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? ColorManager.purpleShade : Colors.grey,
              size: 20.sp,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                color: isSelected ? ColorManager.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
