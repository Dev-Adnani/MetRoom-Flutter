import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.keys.dart';
import 'package:metroom/core/service/cache.service.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/app/routes/app.routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _initiateCache() async {
    return CacheService.conditionalCache(
      key: AppKeys.onBoardDone,
      actionIfNull: () {
        Navigator.of(context).pushNamed(AppRouter.onboardingRoute).whenComplete(
              () => {
                CacheService.setString(key: AppKeys.onBoardDone, value: 'done')
              },
            );
      },
      actionIfNotNull: () {
        CacheService.conditionalCache(
            key: AppKeys.userData,
            actionIfNull: () {
              Navigator.of(context).pushNamed(AppRouter.loginRoute);
            },
            actionIfNotNull: () {
              Navigator.of(context).pushReplacementNamed(AppRouter.loginRoute);
            });
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
    return Scaffold(
      backgroundColor: AppColors.creamColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'MetRoom',
              style: TextStyle(
                color: AppColors.mirage,
                fontSize: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
