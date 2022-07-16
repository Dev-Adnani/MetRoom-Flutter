import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/core/models/events.model.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/notifiers/events.notifier.dart';
import 'package:metroom/core/notifiers/favourite.notifier.dart';
import 'package:metroom/core/notifiers/room.notifier.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/presentation/screens/homeScreen/widgets/events.widget.dart';
import 'package:metroom/presentation/screens/homeScreen/widgets/feature.widget.dart';
import 'package:metroom/presentation/widgets/custom.snackbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    var themeFlag = _themeNotifier.darkTheme;
    double _height = MediaQuery.of(context).size.height / 815;
    AuthenticationNotifer _auth =
        Provider.of<AuthenticationNotifer>(context, listen: true);
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
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hi! , ${_auth.userName ?? 'User'}",
                        style: TextStyle(
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Find and Book",
                        style: TextStyle(
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "The Best Hotel Rooms",
                        style: TextStyle(
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "Featured",
                        style: TextStyle(
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: _height * 280,
                  child: Consumer<RoomNotifier>(
                    builder: (context, notifier, _) {
                      return FutureBuilder(
                        future: notifier.getAllRooms(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            List _snapshot = snapshot.data as List;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                RoomModel roomModel = _snapshot[index];
                                return FeatureRooms(
                                  roomModel: roomModel,
                                  onTapFavorite: () async {
                                    var data =
                                        await Provider.of<FavouriteNotifier>(
                                            context,
                                            listen: false);
                                    bool isAdded = await data.addToFavourite(
                                      userId: _auth.userId!,
                                      room_id: roomModel.roomId,
                                    );
                                    if (isAdded) {
                                      SnackUtil.showSnackBar(
                                        context: context,
                                        text: 'Added To Favourite',
                                        textColor: AppColors.creamColor,
                                        backgroundColor: Colors.red.shade200,
                                      );
                                    } else {
                                      SnackUtil.showSnackBar(
                                        context: context,
                                        text: data.error!,
                                        textColor: AppColors.creamColor,
                                        backgroundColor: Colors.red.shade200,
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Event's",
                        style: TextStyle(
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "Happening, Near By Hotel's",
                        style: TextStyle(
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: _height * 200,
                  child: Consumer<EventsNotifier>(
                    builder: (context, notifier, _) {
                      return FutureBuilder(
                        future: notifier.getAllEvents(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            List _snapshot = snapshot.data as List;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                EventsModel eventsModel = _snapshot[index];
                                return EventsItem(
                                  eventsModel: eventsModel,
                                  onTap: () {
                                    print(eventsModel.eventName);
                                  },
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
