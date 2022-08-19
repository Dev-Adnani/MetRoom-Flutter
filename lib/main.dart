import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metroom/app/constants/app.theme.dart';
import 'package:metroom/app/provider/app.provider.dart';
import 'package:metroom/app/routes/app.routes.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/core/service/network.service.dart';
import 'package:provider/provider.dart';
import 'web_url/configure_nonweb.dart'
    if (dart.library.html) 'web_url/configure_web.dart';

void main() {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const Lava());
}

class Lava extends StatefulWidget {
  const Lava({Key? key}) : super(key: key);

  @override
  State<Lava> createState() => _LavaState();
}

class _LavaState extends State<Lava> {
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        return MultiProvider(
          providers: AppProvider.providers,
          child: const Core(),
        );
      case ConnectivityResult.none:
      default:
        return MaterialApp(
          title: 'Met Room',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRouter.noNetWorkRoute,
        );
    }
  }
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
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
