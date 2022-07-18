import 'package:flutter/material.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/presentation/screens/favouriteScreen/favourite.screen.dart';
import 'package:metroom/presentation/screens/homeScreen/home.screen.dart';
import 'package:metroom/presentation/screens/navigationScreen/widgets/nav.bottomNav.dart';
import 'package:metroom/presentation/screens/searchScreen/search.screen.dart';
import 'package:metroom/presentation/screens/settingScreen/setting.screen.dart';
import 'package:metroom/presentation/screens/signupScreen/signup.screen.dart';
import 'package:provider/provider.dart';

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
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
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
          SearchScreen(),
          FavouriteScreen(),
          SignUpScreen(),
          SettingScreen()
        ],
      ),
      bottomNavigationBar: BottomNav(
        controller: homePageController,
        index: pageIndex,
        themeFlag: themeFlag,
      ),
    );
  }
}
