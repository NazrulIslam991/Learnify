import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/core/resources/constant/color_manager.dart';
import 'package:learnify/core/resources/constant/image_manager.dart';
import 'package:learnify/core/resources/constant/style_manager.dart';
import 'package:learnify/core/routes/route_name.dart';
import 'package:learnify/presentation/widget/custom_text_input_field.dart';
import 'package:learnify/presentation/widget/primary_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  /// *************************** CONTROLLERS ***************************
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// *************************** MAIN CONTAINER ***************************
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

        /// *************************** SAFE AREA ***************************
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),

            /// *************************** SCROLL VIEW ***************************
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// *************************** TOP SPACING ***************************
                  SizedBox(height: 10.h),

                  /// *************************** BACK BUTTON ***************************
                  TextButton.icon(
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

                  SizedBox(height: 30.h),

                  /// *************************** APP ICON ***************************
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(15.w),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withAlpha(50),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Icon(
                        Icons.qr_code_scanner,
                        color: Colors.purpleAccent,
                        size: 40.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// *************************** TITLE ***************************
                  Center(
                    child: Text(
                      "Create Account",
                      style: getSemiBoldStyle28_600(color: ColorManager.white),
                    ),
                  ),

                  /// *************************** SUB TITLE ***************************
                  Center(
                    child: Text(
                      "Start your AI learning journey",
                      style: getRegularStyle16_400(color: Colors.white70),
                    ),
                  ),

                  SizedBox(height: 40.h),

                  /// *************************** FULL NAME FIELD ***************************
                  CustomTextField(
                    label: 'Full Name',
                    hint: "Alex Johnson",
                    controller: _nameController,
                    prefixIcon: Icons.person_outline,
                  ),

                  SizedBox(height: 20.h),

                  /// *************************** EMAIL FIELD ***************************
                  CustomTextField(
                    label: 'Email',
                    hint: "you@university.edu",
                    controller: _emailController,
                    prefixIcon: Icons.email_outlined,
                  ),

                  SizedBox(height: 20.h),

                  /// *************************** PASSWORD FIELD ***************************
                  CustomTextField(
                    label: 'Password',
                    hint: "Min. 8 characters",
                    controller: _passwordController,
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: Icons.remove_red_eye,
                    isPassword: true,
                  ),

                  SizedBox(height: 40.h),

                  /// *************************** CREATE ACCOUNT BUTTON ***************************
                  PrimaryButton(
                    label: "Create Account",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.otpVerificationScreen,
                      );
                    },
                  ),

                  SizedBox(height: 20.h),

                  /// *************************** TERMS & POLICY ***************************
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "By signing up, you agree to our ",
                        style: getRegularStyle12_400(color: Colors.white60),
                        children: [
                          TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          TextSpan(text: " and "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: 30.h),

                  /// *************************** SIGN IN NAVIGATION ***************************
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: getRegularStyle14_400(color: Colors.white70),
                      ),

                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "Sign in",
                          style: getMediumStyle14_500(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
