part of 'route_import_path.dart';

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.splashScreen:
        return _buildRoute(const SplashScreen());

      case RouteName.onboardingScreen:
        return _buildRoute(OnboardingScreen());
      case RouteName.signInScreen:
        return _buildRoute(SigninScreen());
      case RouteName.signUpScreen:
        return _buildRoute(SignupScreen());
      case RouteName.forgotPasswordScreen:
        return _buildRoute(ForgotPasswordScreen());
      case RouteName.navBarScreen:
        return _buildRoute(NavbarScreen());
      case RouteName.captureScreen:
        return _buildRoute(CaptureScreen());
      case RouteName.previewImageScreen:
        final String imagePath = routeSettings.arguments as String;
        return _buildRoute(PreviewImageScreen(imagePath: imagePath));
      case RouteName.imageProcessionScreen:
        return _buildRoute(ImageProcessionScreen());
      case RouteName.generatingQuestionScreen:
        return _buildRoute(GeneratingQuestionScreen());
      default:
        return unDefineRoute();
    }
  }

  /// CLEAN ROUTE (NO SIDE EFFECT, NO COLOR FLASH)
  static PageRouteBuilder _buildRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,

      transitionDuration: const Duration(milliseconds: 250),

      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },

      /// IMPORTANT: removes black/white side flicker
      maintainState: true,
    );
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
