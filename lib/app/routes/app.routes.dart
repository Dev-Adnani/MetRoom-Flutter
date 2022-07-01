import 'package:flutter/material.dart';
import 'package:metroom/presentation/screens/loginScreen/login.screen.dart';
import 'package:metroom/presentation/screens/onBoardingScreen/on.boarding.screen.dart';
import 'package:metroom/presentation/screens/splashScreen/splash.screen.dart';

class AppRouter {
  static const String loginRoute = "/login";
  static const String onboardingRoute = "/onboard";
  static const String splashRoute = "/spalsh";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        {
          return MaterialPageRoute(
            builder: (_) => SplashScreen(),
          );
        }
      case onboardingRoute:
        {
          return MaterialPageRoute(
            builder: (_) => OnBoardingScreen(),
          );
        }
      case loginRoute:
        {
          return MaterialPageRoute(
            builder: (_) => LoginScreen(),
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
          );
        }
    }
  }
}
