import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/core/resources/constant/color_manager.dart';
import 'package:learnify/core/resources/constant/image_manager.dart';
import 'package:learnify/core/resources/constant/style_manager.dart';
import 'package:learnify/presentation/widget/primary_button.dart';

import '../../../widget/custom_text_input_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageManager.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  /// *************************** TOP BACK BUTTON ***************************
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                      label: Text(
                        "Back",
                        style: getRegularStyle16_400(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    ),
                  ),

                  SizedBox(height: 60.h),

                  /// *************************** ICON ***************************
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(15.w),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withAlpha(50),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Icon(
                        Icons.lock_reset,
                        color: Colors.purpleAccent,
                        size: 40.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// *************************** TITLE & SUBTITLE ***************************
                  Center(
                    child: Text(
                      "Forgot Password",
                      style: getSemiBoldStyle28_600(color: ColorManager.white),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Enter your email to receive a password reset link.",
                    textAlign: TextAlign.center,
                    style: getRegularStyle16_400(
                      color: ColorManager.white.withAlpha(150),
                    ),
                  ),

                  SizedBox(height: 40.h),

                  /// *************************** EMAIL FIELD ***************************
                  CustomTextField(
                    hint: "you@university.edu",
                    controller: _emailController,
                    prefixIcon: Icons.email_outlined,
                    label: 'Email',
                  ),

                  SizedBox(height: 30.h),

                  /// *************************** SUBMIT BUTTON ***************************
                  PrimaryButton(
                    label: "Send Reset Link",
                    onPressed: () {
                      // TODO: Add reset logic here
                    },
                  ),

                  SizedBox(height: 20.h),

                  /// *************************** BACK TO SIGNIN ***************************
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Back to Sign In",
                        style: getMediumStyle14_500(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
