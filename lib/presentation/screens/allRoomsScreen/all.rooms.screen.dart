import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/app/routes/app.routes.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/core/notifiers/room.notifier.dart';
import 'package:metroom/core/notifiers/sorts.notifier.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/presentation/screens/allRoomsScreen/widgets/sort.menu.two.widget.dart';
import 'package:metroom/presentation/screens/allRoomsScreen/widgets/sort.menu.widget.dart';
import 'package:metroom/presentation/screens/roomScreen/room.screen.dart';
import 'package:metroom/presentation/screens/searchScreen/widgets/search.items.dart';
import 'package:metroom/presentation/widgets/no.data.dart';
import 'package:metroom/presentation/widgets/shimmer.effects.dart';
import 'package:provider/provider.dart';

class AllRoomScreen extends StatelessWidget {
  const AllRoomScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    var themeFlag = _themeNotifier.darkTheme;

    double _height = MediaQuery.of(context).size.height / 815;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Text(
                  "All Rooms",
                  style: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Find The Best Available Room",
                      style: TextStyle(
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SortMenuTwo(),
                        SizedBox(
                          width: 10,
                        ),
                        SortMenuOne(),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: _height * 670,
                child: Consumer<RoomNotifier>(
                  builder: (context, notifier, _) {
                    return FutureBuilder(
                      future: notifier.getAllRooms(
                        roomSort:
                            Provider.of<SortNotifier>(context, listen: true)
                                .roomSort,
                        sortBy: Provider.of<SortNotifier>(context, listen: true)
                            .sortBySys,
                      ),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return ShimmerEffects.loadShimmerFavouriteandSearch(
                            context: context,
                            displayTrash: false,
                          );
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
                                RoomModel roomModel = _snapshot[index];
                                return SearchItem(
                                  roomModel: roomModel,
                                  onTap: () {
                                    // Navigator.of(context).pushNamed(
                                    //   AppRouter.roomDetailRoute,
                                    //   arguments: RoomScreenArgs(
                                    //     room_id: roomModel.roomId,
                                    //   ),
                                    // );
                                    print(Provider.of<SortNotifier>(context,
                                            listen: false)
                                        .sortBySys);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
