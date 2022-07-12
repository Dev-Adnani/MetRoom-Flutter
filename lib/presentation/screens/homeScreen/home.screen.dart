import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.keys.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/service/cache.service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Daba'),
          onPressed: () async {
            var da = await CacheService.getInt(key: AppKeys.userData);
            print(da);
            if (da != null) {
              var data = await Provider.of<AuthenticationNotifer>(context,
                      listen: false)
                  .getUserDataByID(user_id: da);

              print(data!.data);
            }
          },
        ),
      ),
    );
  }
}
