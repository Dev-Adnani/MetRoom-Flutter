import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.keys.dart';
import 'package:metroom/core/service/cache.service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Daba'),
          onPressed: () async {
            var da = CacheService.getJson(key: AppKeys.userMeta);
            print(da);
          },
        ),
      ),
    );
  }
}
