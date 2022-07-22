import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';

Widget RoomFooter() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.green.shade200,
            borderRadius: BorderRadius.circular(30)),
        child: const Icon(
          Icons.pin_drop,
          color: Colors.white,
          size: 18,
        ),
      ),
      const Spacer(),
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.red.shade200,
            borderRadius: BorderRadius.circular(30)),
        child: const Icon(
          Icons.phone,
          color: Colors.white,
          size: 18,
        ),
      ),
      const Spacer(),
      Expanded(
        flex: 15,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: AppColors.yellowish,
          ),
          child: Text(
            "Book Now",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
  );
}
