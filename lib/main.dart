import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metroom/app/constants/app.theme.dart';
import 'package:metroom/app/provider/app.provider.dart';
import 'package:metroom/app/routes/app.routes.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const Lava());
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: const Core(),
    );
  }
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, _) {
        return MaterialApp(
          title: 'Met Room',
          theme: notifier.darkTheme ? darkTheme : lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRouter.splashRoute,
        );
      },
    );
  }
}
