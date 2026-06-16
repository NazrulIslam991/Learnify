import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/core/resources/constant/color_manager.dart';
import 'package:learnify/core/resources/constant/image_manager.dart';
import 'package:learnify/core/resources/constant/style_manager.dart';
import 'package:learnify/core/routes/route_name.dart';
import 'package:learnify/presentation/widget/primary_button.dart';

import '../../../widget/custom_text_input_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  /// *************************** CONTROLLERS ***************************
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// *************************** TOP SPACING ***************************
                  SizedBox(height: 60.h),

                  /// *************************** APP ICON ***************************
                  Container(
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

                  SizedBox(height: 20.h),

                  /// *************************** APP TITLE ***************************
                  Text(
                    "Scanthesis AI",
                    style: getSemiBoldStyle28_600(color: ColorManager.white),
                  ),

                  SizedBox(height: 5.h),

                  /// *************************** SUB TITLE ***************************
                  Text(
                    "Welcome back, scholar",
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

                  SizedBox(height: 20.h),

                  /// *************************** PASSWORD FIELD ***************************
                  CustomTextField(
                    hint: "••••••••",
                    controller: _passwordController,
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: Icons.remove_red_eye,
                    isPassword: true,
                    label: 'Password',
                  ),

                  /// *************************** FORGOT PASSWORD ***************************
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.forgotPasswordScreen,
                        );
                      },
                      child: Text(
                        "Forgot password?",
                        style: getRegularStyle14_400(color: Colors.blueAccent),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// *************************** SIGN IN BUTTON ***************************
                  PrimaryButton(
                    label: "Sign In",
                    onPressed: () {
                      /* Sign in logic */
                    },
                  ),

                  SizedBox(height: 30.h),

                  /// *************************** DIVIDER ***************************
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.white24)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "or continue with",
                          style: getRegularStyle12_400(color: Colors.white30),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white24)),
                    ],
                  ),

                  SizedBox(height: 30.h),

                  /// *************************** GOOGLE LOGIN ***************************
                  PrimaryButton(
                    label: "Continue with Google",
                    icon: Icons.g_mobiledata,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      /* Google login logic */
                    },
                  ),

                  SizedBox(height: 20.h),

                  /// *************************** SIGN UP NAVIGATION ***************************
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: getRegularStyle14_400(color: Colors.white70),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.signUpScreen);
                        },
                        child: Text(
                          "Sign up",
                          style: getMediumStyle14_500(color: Colors.blueAccent),
                        ),
                      ),
                    ],
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
