import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.keys.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/core/service/cache.service.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/app/routes/app.routes.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _initiateCache() async {
    return CacheService.conditionalCache(
      key: AppKeys.onBoardDone,
      valueType: ValueType.StringValue,
      actionIfNull: () {
        Navigator.of(context)
            .pushReplacementNamed(AppRouter.onboardingRoute)
            .whenComplete(
              () => {
                CacheService.setString(key: AppKeys.onBoardDone, value: 'done')
              },
            );
      },
      actionIfNotNull: () {
        CacheService.conditionalCache(
          valueType: ValueType.IntValue,
          key: AppKeys.userData,
          actionIfNull: () {
            Navigator.of(context).pushReplacementNamed(AppRouter.loginRoute);
          },
          actionIfNotNull: () async {
            var user_id = await CacheService.getInt(key: AppKeys.userData);
            Provider.of<AuthenticationNotifer>(context, listen: false)
                .getUserDataByID(user_id: user_id);
            Navigator.of(context).pushReplacementNamed(AppRouter.navRoute);
          },
        );
      },
    );
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 1), _initiateCache);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'MetRoom',
              style: TextStyle(
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                fontSize: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
