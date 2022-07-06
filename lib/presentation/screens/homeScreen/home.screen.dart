import 'package:flutter/material.dart';
import 'package:metroom/core/notifiers/auth.notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dt = Provider.of<AuthNotifer>(context, listen: false);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Daba'),
          onPressed: () {
          
          },
        ),
      ),
    );
  }
}
