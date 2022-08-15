import 'package:flutter/material.dart';
import 'package:metroom/core/models/room.model.dart';

class BookingScreen extends StatelessWidget {
  final BookingScreenArgs bookingScreenArgs;
  const BookingScreen({Key? key, required this.bookingScreenArgs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}

class BookingScreenArgs {
  final RoomModel roomData;
  final dynamic user_id;

  BookingScreenArgs({
    required this.user_id,
    required this.roomData,
  }); 
}
