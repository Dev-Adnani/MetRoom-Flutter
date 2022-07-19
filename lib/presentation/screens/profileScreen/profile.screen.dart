import 'package:flutter/material.dart';
import 'package:metroom/core/service/photo.service.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Provider.of<PhotoService>(context, listen: false).selectFile();
              },
              child: Text('sda'),
            ),
            ElevatedButton(
              onPressed: () async {
                var x = await Provider.of<PhotoService>(context, listen: false)
                    .upload(context: context);
                print('X = $x');
              },
              child: Text('dasd'),
            ),
          ],
        ),
      ),
    );
  }
}
