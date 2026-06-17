import 'package:flutter/cupertino.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteName {
  static const String splashScreen = "/SplashScreen";
  static const String onboardingScreen = "/onboardingScreen";
  static const String signInScreen = "/signInScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";
  static const String navBarScreen = "/navBarScreen";
  static const String captureScreen = "/captureScreen";
  static const String previewImageScreen = "/previewImageScreen";
  static const String imageProcessionScreen = "/imageProcessionScreen";
  static const String generatingQuestionScreen = "/generatingQuestionScreen";
}
