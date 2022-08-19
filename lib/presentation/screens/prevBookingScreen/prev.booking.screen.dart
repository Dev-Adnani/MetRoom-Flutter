import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/app/routes/app.routes.dart';
import 'package:metroom/core/models/booking.model.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/notifiers/booking.notifer.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/presentation/screens/prevBookingScreen/widgets/booking.item.dart';
import 'package:metroom/presentation/screens/roomScreen/room.screen.dart';
import 'package:metroom/presentation/widgets/no.data.dart';
import 'package:metroom/presentation/widgets/shimmer.effects.dart';
import 'package:provider/provider.dart';

class PreviousBookingScreen extends StatelessWidget {
  const PreviousBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    AuthenticationNotifer _auth =
        Provider.of<AuthenticationNotifer>(context, listen: false);
    var themeFlag = _themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: Text(
                    "Bookings",
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: Text(
                    "Your Previous Bookings",
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                ),
                Consumer<BookingNotifier>(
                  builder: (context, notifier, _) {
                    return FutureBuilder(
                      future: notifier.getSpecificRoom(userId: _auth.userId!),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return ShimmerEffects.loadBookingItem(
                              context: context);
                        } else {
                          List _snapshot = snapshot.data as List;

                          if (_snapshot.isEmpty) {
                            return noDataFound(
                              themeFlag: themeFlag,
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                BookingModel bookingModel = _snapshot[index];
                                return BookingItem(
                                  bookingModel: bookingModel,
                                  themeFlag: themeFlag,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRouter.roomDetailRoute,
                                      arguments: RoomScreenArgs(
                                        room_id: bookingModel.rooms!.roomId,
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
