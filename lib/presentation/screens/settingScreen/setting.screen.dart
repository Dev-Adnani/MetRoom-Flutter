import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/presentation/screens/settingScreen/widgets/icon.style.dart';
import 'package:metroom/presentation/screens/settingScreen/widgets/setting.item.dart';
import 'package:metroom/presentation/screens/settingScreen/widgets/setting.user.card.dart';
import 'package:metroom/presentation/screens/settingScreen/widgets/setting.appbar.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    var themeFlag = _themeNotifier.darkTheme;
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
              userName: 'Dev Adnani',
              userProfileUrl:
                  'https://avatars.githubusercontent.com/u/61565182?v=4',
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
              subtitle: "Automatic",
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
              onTap: () {},
              icons: CupertinoIcons.profile_circled,
              iconStyle: IconStyle(),
              title: 'Profile',
              subtitle: "Modify Your Data",
            ),
            SettingsItem(
              onTap: () {},
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
              onTap: () {},
              icons: Icons.info_rounded,
              iconStyle: IconStyle(
                backgroundColor: Colors.purple,
              ),
              title: 'About',
              subtitle: "Learn more about MetRoom'App",
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () {},
              icons: CupertinoIcons.chat_bubble,
              iconStyle: IconStyle(
                backgroundColor: Colors.deepOrangeAccent,
              ),
              title: 'Send Feedback',
              subtitle: "We Listen To Our Customer's",
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () {},
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
}
