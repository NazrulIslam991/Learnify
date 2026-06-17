import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/core/resources/constant/color_manager.dart';
import 'package:learnify/core/resources/constant/image_manager.dart';
import 'package:learnify/core/resources/constant/style_manager.dart';

import '../../navbar/viewmodel/navbar_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorManager.black6,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              /// ******************** Header Section **************************
              /// Displays the user greeting, name, and notification icon/profile picture.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good morning 👋",
                        style: getRegularStyle16_400(color: ColorManager.gray),
                      ),
                      Text(
                        "Alex Johnson",
                        style: getSemiBoldStyle28_600(
                          color: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                      SizedBox(width: 15.w),
                      CircleAvatar(
                        radius: 18.r,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(ImageManager.profileImg),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              /// ******************** Stats Row **************************
              /// Displays three statistical cards: Scans, Cards, and Streak.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard("47", "Scans", Icons.flash_on),
                  _buildStatCard("284", "Cards", Icons.menu_book),
                  _buildStatCard("12d", "Streak", Icons.star_border),
                ],
              ),
              SizedBox(height: 25.h),

              /// ******************** Scan Promo Card **************************
              /// A promotional gradient card that prompts the user to start a new scan.
              Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4A3AFF), Color(0xFF6D5BFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ready to Scan?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "Turn any page into AI knowledge cards",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.read(navbarProvider.notifier).setIndex(2);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(15),
                          borderRadius: BorderRadius.circular(55.r),
                          border: Border.all(color: Colors.white.withAlpha(90)),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Scan",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14.sp,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              /// ******************** Recent Scans Header **************************
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Scans",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),

              /// ******************** Recent Scans List **************************
              /// Displays a list of recent scan items.
              Expanded(
                child: ListView(
                  children: [
                    _buildRecentScanItem(
                      "Quantum Mechanics",
                      "Physics",
                      "12 cards",
                      "2 min ago",
                    ),
                    SizedBox(height: 8.h),
                    _buildRecentScanItem(
                      "Keynesian Economic",
                      "Economics",
                      "8 cards",
                      "1h ago",
                    ),
                    SizedBox(height: 8.h),
                    _buildRecentScanItem(
                      "French Revolution",
                      "History",
                      "15 cards",
                      "3h ago",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ******************** _buildStatCard **************************
  /// Generates a reusable card for displaying statistics (icon, value, label).
  Widget _buildStatCard(String value, String label, IconData icon) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          color: ColorManager.navbar,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          children: [
            Icon(icon, color: ColorManager.purpleShade, size: 20.sp),
            SizedBox(height: 5.h),
            Text(
              value,
              style: getSemiBoldStyle28_600(
                color: ColorManager.white,
                fontSize: 20.sp,
              ),
            ),
            Text(
              label,
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }

  /// ******************** _buildRecentScanItem **************************
  /// Creates a list tile for recent scan history, showing category initial, title, and timestamp.
  Widget _buildRecentScanItem(
    String title,
    String category,
    String count,
    String time,
  ) {
    String initial = category.isNotEmpty ? category[0].toUpperCase() : "";

    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorManager.deepPurpleBg,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              initial,
              style: TextStyle(
                color: Colors.green,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$category • $time",
                  style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                ),
              ],
            ),
          ),
          Text(
            count,
            style: TextStyle(
              color: ColorManager.purpleShade,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
