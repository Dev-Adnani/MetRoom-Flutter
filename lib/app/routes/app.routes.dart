import 'package:flutter/material.dart';
import 'package:metroom/presentation/screens/deciderScreen/decider.screen.dart';
import 'package:metroom/presentation/screens/loginScreen/login.screen.dart';
import 'package:metroom/presentation/screens/onBoardingScreen/on.boarding.screen.dart';
import 'package:metroom/presentation/screens/signupScreen/signup.screen.dart';
import 'package:metroom/presentation/screens/splashScreen/splash.screen.dart';

class AppRouter {
  static const String onboardingRoute = "/onboard";
  static const String splashRoute = "/splash";
  static const String deciderRoute = "/decider";
  static const String loginRoute = "/login";
  static const String signupRoute = "/signup";

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
      case deciderRoute:
        {
          return MaterialPageRoute(
            builder: (_) => DeciderScreen(),
          );
        }
      case loginRoute:
        {
          return MaterialPageRoute(
            builder: (_) => LoginScreen(),
          );
        }
      case signupRoute:
        {
          return MaterialPageRoute(
            builder: (_) => SignUpScreen(),
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
