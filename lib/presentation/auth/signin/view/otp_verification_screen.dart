import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/constant/image_manager.dart';
import '../../../../core/routes/route_name.dart';
import '../../../widget/primary_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  String getOtp() {
    return _otpControllers.map((e) => e.text).join();
  }

  void verifyOtp() {
    String otp = getOtp();
    debugPrint("OTP Entered: $otp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1020),
      body: Container(
        width: double.infinity,
        height: double.infinity,

        /// *************************** BACKGROUND IMAGE ***************************
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageManager.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                SizedBox(height: 40.h),

                /// 🔥 ICON
                Container(
                  padding: EdgeInsets.all(18.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.05),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: const Icon(
                    Icons.lock_outline,
                    color: Colors.purpleAccent,
                    size: 40,
                  ),
                ),

                SizedBox(height: 25.h),

                /// TITLE
                Text(
                  "Verify Your Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  "Enter the 4-digit code sent to your email",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 13.sp),
                ),

                SizedBox(height: 40.h),

                /// 🔥 OTP BOXES
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return _otpBox(index);
                  }),
                ),

                SizedBox(height: 30.h),

                /// VERIFY BUTTON
                PrimaryButton(
                  label: "Verify",
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.signInScreen);
                  },
                ),

                SizedBox(height: 20.h),

                /// RESEND TEXT
                Text(
                  "Didn't receive code? Resend",
                  style: TextStyle(color: Colors.white54, fontSize: 13.sp),
                ),

                const Spacer(),

                Text(
                  "Learnify Security System",
                  style: TextStyle(color: Colors.white24, fontSize: 11.sp),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔥 OTP BOX DESIGN
  Widget _otpBox(int index) {
    return Container(
      width: 55.w,
      height: 55.w,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Center(
        child: TextField(
          controller: _otpControllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.isNotEmpty && index < 3) {
              _focusNodes[index + 1].requestFocus();
            }
            if (value.isEmpty && index > 0) {
              _focusNodes[index - 1].requestFocus();
            }
          },
        ),
      ),
    );
  }
}
