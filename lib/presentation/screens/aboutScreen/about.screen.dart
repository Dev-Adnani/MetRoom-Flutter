import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.assets.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/presentation/screens/aboutScreen/widgets/about.appbar.dart';
import 'package:metroom/presentation/widgets/custom.styles.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    var themeFlag = _themeNotifier.darkTheme;
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: aboutAppBar(themeFlag: themeFlag,),
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: Column(
        children: [
          SizedBox(
            height: mediaQueryHeight / 8,
          ),
          Center(
            child: Image.asset(
              AppAssets.logo,
              height: 140,
              width: 140,
            ),
          ),
          SizedBox(
            height: mediaQueryHeight / 20,
          ),
          Text(
            'MetRoom',
            textAlign: TextAlign.left,
            style: kBodyText.copyWith(
              fontSize: 25,
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
          SizedBox(
            height: mediaQueryHeight / 50,
          ),
          Text(
            'Package Name : com.dev.metroom',
            textAlign: TextAlign.left,
            style: kBodyText.copyWith(
              fontSize: 16,
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
          Text(
            'Build Number : 1',
            textAlign: TextAlign.left,
            style: kBodyText.copyWith(
              fontSize: 16,
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
          Text(
            'Version : 1.0.0',
            textAlign: TextAlign.left,
            style: kBodyText.copyWith(
              fontSize: 16,
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          )
        ],
      ),
    );
  }
}
