import 'package:flutter/material.dart';
import 'package:metroom/presentation/screens/homeScreen/home.screen.dart';
import 'package:metroom/presentation/screens/loginScreen/login.screen.dart';
import 'package:metroom/presentation/screens/navigationScreen/widgets/nav.bottomNav.dart';
import 'package:metroom/presentation/screens/signupScreen/signup.screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;
  final PageController homePageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: homePageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
        children: [
          HomeScreen(),
          LoginScreen(),
          LoginScreen(),
          SignUpScreen(),
          SignUpScreen()
        ],
      ),
      bottomNavigationBar: BottomNav(
        controller: homePageController,
        index: pageIndex,
      ),
    );
  }
}
