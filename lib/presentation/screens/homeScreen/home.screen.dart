import 'package:flutter/material.dart';
import 'package:metroom/presentation/screens/homeScreen/widgets/home.bottomNav.dart';
import 'package:metroom/presentation/screens/loginScreen/login.screen.dart';
import 'package:metroom/presentation/screens/signupScreen/signup.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          LoginScreen(),
          LoginScreen(),
          LoginScreen(),
          SignUpScreen(),
          SignUpScreen()
        ],
      ),
      bottomNavigationBar: homeBottomNav(
        controller: homePageController,
        index: pageIndex,
      ),
    );
  }
}
