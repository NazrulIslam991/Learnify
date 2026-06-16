import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/core/resources/constant/color_manager.dart';
import 'package:learnify/core/resources/constant/image_manager.dart';
import 'package:learnify/core/routes/route_name.dart';

import '../../../core/resources/constant/style_manager.dart';
import '../../../presentation/onboarding/viewmodel/onboarding_viewmodel.dart';

class OnboardingScreen extends ConsumerWidget {
  /// ************************** comments ***************************
  /// Controller used to handle the swiping behavior of the onboarding pages
  final PageController _pageController = PageController();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ************************** comments ***************************
    /// Watching the current page index from the OnboardingViewModel state
    final currentPage = ref.watch(onboardingProvider);

    /// Accessing the Notifier to call state-changing methods like setPage()
    final notifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          /// ************************** comments ***************************
          /// Background layer displaying the app's onboarding aesthetic
          Positioned.fill(
            child: Image.asset(ImageManager.background, fit: BoxFit.cover),
          ),

          SafeArea(
            child: Column(
              children: [
                /// ************************** comments ***************************
                /// Skip button allows users to bypass the onboarding flow
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteName.signInScreen,
                        (predicate) => false,
                      );
                    },
                    child: Text(
                      "Skip",
                      style: getRegularStyle16_400(
                        color: ColorManager.white.withAlpha(100),
                      ),
                    ),
                  ),
                ),

                /// ************************** comments ***************************
                /// Main PageView to display dynamic slides based on the ViewModel
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) => notifier.setPage(index),
                    itemCount: notifier.pages.length,
                    itemBuilder: (context, index) {
                      final page = notifier.pages[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// ************************** comments ***************************
                            /// Icon container with responsive padding and border radius
                            Container(
                              padding: EdgeInsets.all(30.r),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Icon(
                                page.icon,
                                size: 80.sp,
                                color: Colors.blueAccent,
                              ),
                            ),
                            SizedBox(height: 40.h),
                            Text(
                              page.title,
                              style: getSemiBoldStyle28_600(
                                color: ColorManager.white,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              page.description,
                              textAlign: TextAlign.center,
                              style: getRegularStyle16_400(
                                color: ColorManager.white.withAlpha(180),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                /// ************************** comments ***************************
                /// Row generating dynamic indicators based on page count
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    notifier.pages.length,
                    (index) => buildDot(index, currentPage),
                  ),
                ),

                /// ************************** comments ***************************
                /// Navigation button for moving to next page or initializing app
                Padding(
                  padding: EdgeInsets.all(30.w),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      onPressed: () {
                        if (currentPage < notifier.pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteName.signInScreen,
                            (predicate) => false,
                          );
                        }
                      },
                      child: Text(
                        currentPage == notifier.pages.length - 1
                            ? "Get Started"
                            : "Next >",
                        style: getMediumStyle16_500(color: ColorManager.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ************************** comments ***************************
  /// Helper widget to generate animated indicator dots for page tracking
  Widget buildDot(int index, int currentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 8.h,
      width: currentPage == index ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blueAccent : Colors.grey,
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }
}
