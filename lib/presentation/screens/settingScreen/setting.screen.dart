import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/app/constants/app.keys.dart';
import 'package:metroom/app/routes/app.routes.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/core/service/cache.service.dart';
import 'package:metroom/presentation/screens/profileScreen/profile.screen.dart';
import 'package:metroom/presentation/screens/settingScreen/widgets/icon.style.dart';
import 'package:metroom/presentation/screens/settingScreen/widgets/setting.item.dart';
import 'package:metroom/presentation/screens/settingScreen/widgets/setting.user.card.dart';
import 'package:metroom/presentation/screens/settingScreen/widgets/setting.appbar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    var themeFlag = _themeNotifier.darkTheme;
    var userData = Provider.of<AuthenticationNotifer>(context, listen: true);
    return Scaffold(
      appBar: settingAppBar(themeFlag: themeFlag),
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            UserCard(
              cardColor: AppColors.rawSienna,
              userName: userData.userName!,
              userProfileUrl: userData.userPhoto!,
              onTap: () {},
            ),
            SizedBox(
              height: 10,
            ),
            SettingsItem(
              onTap: () {
                _themeNotifier.toggleTheme();
              },
              icons: Icons.dark_mode_rounded,
              iconStyle: IconStyle(
                iconsColor: Colors.white,
                withBackground: true,
                backgroundColor: AppColors.yellowish,
              ),
              title: 'Dark mode',
              subtitle: "Change App Theme",
              trailing: Switch.adaptive(
                value: _themeNotifier.darkTheme,
                onChanged: (value) {
                  _themeNotifier.darkTheme = !value;
                  _themeNotifier.toggleTheme();
                },
              ),
              themeFlag: themeFlag,
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRouter.profileRoute,
                  arguments: ProfileTaskArgs(
                    user_name: userData.userName!,
                    user_email: userData.userEmail!,
                    user_phoneNo: userData.userPhoneNo!,
                    user_image: userData.userPhoto!,
                  ),
                );
              },
              icons: CupertinoIcons.profile_circled,
              iconStyle: IconStyle(),
              title: 'Profile',
              subtitle: "Modify Your Data",
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.prevbookingRoute);
              },
              icons: CupertinoIcons.bookmark_fill,
              iconStyle: IconStyle(
                backgroundColor: Colors.brown,
              ),
              title: 'Bookings',
              subtitle: "Check Old Bookings!",
            ),
            SettingsItem(
              onTap: () async {
                final Uri _url =
                    Uri.parse('https://www.devadnani.com/pPolicy.html');
                launchUrl(_url);
              },
              themeFlag: themeFlag,
              icons: Icons.fingerprint,
              iconStyle: IconStyle(
                iconsColor: Colors.white,
                withBackground: true,
                backgroundColor: Colors.green,
              ),
              title: 'Privacy',
              subtitle: "Improve Your Privacy",
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.aboutRoute);
              },
              icons: Icons.info_rounded,
              iconStyle: IconStyle(
                backgroundColor: Colors.purple,
              ),
              title: 'About',
              subtitle: "Learn more about MetRoom'App",
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.feedbackRoute);
              },
              icons: CupertinoIcons.chat_bubble,
              iconStyle: IconStyle(
                backgroundColor: Colors.deepOrangeAccent,
              ),
              title: 'Send Feedback',
              subtitle: "We Listen To Our Customer's",
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () {
                showAlertDialog(context: context, themeFlag: themeFlag);
              },
              icons: Icons.logout,
              iconStyle: IconStyle(
                backgroundColor: Colors.red,
              ),
              subtitle: "Cya Later",
              title: "Sign Out",
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog({
    required BuildContext context,
    required bool themeFlag,
  }) {
    Widget cancelButton = TextButton(
      child: const Text(
        "No",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.blueAccent,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "Yes",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
      ),
      onPressed: () {
        CacheService.deleteKey(key: AppKeys.userData).whenComplete(() {
          Navigator.of(context).pushReplacementNamed(AppRouter.deciderRoute);
        });
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        "Are You Sure You Want To Logout ?",
        style: TextStyle(
          color: themeFlag ? AppColors.creamColor : AppColors.mirage,
          fontSize: 18,
        ),
      ),
      content: Text(
        "You Will Regret About It!",
        style: TextStyle(
          color: themeFlag ? AppColors.creamColor : AppColors.mirage,
          fontSize: 16,
        ),
      ),
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
