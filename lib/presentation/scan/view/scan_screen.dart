import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/core/resources/constant/color_manager.dart';
import 'package:learnify/core/routes/route_name.dart';
import 'package:learnify/presentation/widget/primary_button.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1A),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                /// 🔝 TITLE
                Text(
                  "AI Study Scanner",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  "Scan any page and instantly generate Questions with Answers using AI",
                  style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                ),

                SizedBox(height: 30.h),

                ///  FLOW CARDS
                _flowCard(
                  step: "1",
                  title: "Scan Page",
                  desc: "Capture any book, notes or document",
                  icon: Icons.document_scanner,
                ),

                _flowCard(
                  step: "2",
                  title: "AI Processing",
                  desc: "AI analyzes content and understands key topics",
                  icon: Icons.auto_awesome,
                ),

                _flowCard(
                  step: "3",
                  title: "Generate Q&A",
                  desc: "Automatically creates short questions with answers",
                  icon: Icons.quiz,
                ),

                _flowCard(
                  step: "4",
                  title: "Study Cards",
                  desc: "Save as flashcards for quick revision anytime",
                  icon: Icons.style,
                ),

                SizedBox(height: 10.h),

                ///  INFO BOX
                Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What you will get after scan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "✔ Short Questions (MCQ / Short Q)\n"
                        "✔ Easy-to-understand Answers\n"
                        "✔ Key points summary\n"
                        "✔ Flashcards for revision",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                /// BUTTON
                PrimaryButton(
                  label: "Start Scanning",
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.captureScreen);
                  },
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///  FLOW CARD (RESPONSIVE)
  Widget _flowCard({
    required String step,
    required String title,
    required String desc,
    required IconData icon,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          /// STEP
          CircleAvatar(
            radius: 14.r,
            backgroundColor: ColorManager.purpleShade,
            child: Text(
              step,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(width: 15.w),

          /// ICON
          Icon(icon, color: ColorManager.mintMist, size: 22.sp),

          SizedBox(width: 15.w),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  desc,
                  style: TextStyle(color: Colors.white70, fontSize: 11.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
