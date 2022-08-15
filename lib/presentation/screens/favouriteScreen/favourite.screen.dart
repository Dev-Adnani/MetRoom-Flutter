import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/app/routes/app.routes.dart';
import 'package:metroom/core/models/favourite.model.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/notifiers/favourite.notifier.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/presentation/screens/favouriteScreen/widgets/favourite.item.widget.dart';
import 'package:metroom/presentation/screens/roomScreen/room.screen.dart';
import 'package:metroom/presentation/widgets/no.data.dart';
import 'package:metroom/presentation/widgets/custom.snackbar.dart';
import 'package:metroom/presentation/widgets/shimmer.effects.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    var themeFlag = _themeNotifier.darkTheme;
    AuthenticationNotifer _auth =
        Provider.of<AuthenticationNotifer>(context, listen: true);
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
                  "Favourite",
                  style: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Text(
                  "Your Favourite Room's",
                  style: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              Container(
                height: _height * 620,
                child: Consumer<FavouriteNotifier>(
                  builder: (context, notifier, _) {
                    return FutureBuilder(
                      future: notifier.getAllFavourite(userId: _auth.userId!),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return ShimmerEffects.loadShimmerFavouriteandSearch(
                            context: context,
                            displayTrash: true,
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
                                FavouriteModel favouriteModel =
                                    _snapshot[index];
                                return FavouriteItem(
                                  favouriteModel: favouriteModel,
                                  onDelete: () async {
                                    bool isDeleted =
                                        await notifier.deleteFromFavourite(
                                      favouriteId: favouriteModel.favouriteId,
                                    );
                                    if (isDeleted) {
                                      SnackUtil.showSnackBar(
                                        context: context,
                                        text: "Deleted Successfully",
                                        textColor: AppColors.creamColor,
                                        backgroundColor: Colors.green,
                                      );
                                    } else {
                                      SnackUtil.showSnackBar(
                                        context: context,
                                        text: "Oops Some Error Occured",
                                        textColor: AppColors.creamColor,
                                        backgroundColor: Colors.red.shade200,
                                      );
                                    }
                                  },
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRouter.roomDetailRoute,
                                      arguments: RoomScreenArgs(
                                        room_id: favouriteModel.rooms.roomId,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
