import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/core/resources/constant/color_manager.dart';
import 'package:learnify/core/resources/constant/style_manager.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.prefixIcon,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: getMediumStyle14_500(color: ColorManager.white)),

        SizedBox(height: 8.h),

        TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: getRegularStyle16_400(color: ColorManager.white),

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: getRegularStyle16_400(color: Colors.white30),

            prefixIcon: Icon(prefixIcon, color: Colors.white30),

            /// ✅ FIX: proper suffixIcon usage
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: Colors.white30)
                : null,

            filled: true,
            fillColor: const Color(0x0DFFFFFF),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
