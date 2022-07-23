import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/app/routes/app.routes.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/presentation/screens/bookingScreen/booking.screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map_launcher/map_launcher.dart';

class RoomFooter extends StatelessWidget {
  final RoomModel roomModel;

  const RoomFooter({
    Key? key,
    required this.roomModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userId =
        Provider.of<AuthenticationNotifer>(context, listen: false).userId;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            final availableMaps = await MapLauncher.installedMaps;
            await availableMaps.first.showMarker(
                coords: Coords(roomModel.roomLat, roomModel.roomLong),
                title: roomModel.roomName);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.pin_drop,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            final Uri _url = Uri.parse('tel://${roomModel.roomCallNo}');
            launchUrl(_url);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.red.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.phone,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 15,
          child: ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pushNamed(
                AppRouter.bookingRoute,
                arguments: BookingScreenArgs(
                  user_id: userId,
                  roomData: roomModel,
                ),
              );
            },
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
        ),
      ],
    );
  }
}
