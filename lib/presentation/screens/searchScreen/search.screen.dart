import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/app/routes/app.routes.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/core/notifiers/room.notifier.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/presentation/screens/roomScreen/room.screen.dart';
import 'package:metroom/presentation/widgets/no.data.dart';
import 'package:metroom/presentation/screens/searchScreen/widgets/search.items.dart';
import 'package:metroom/presentation/widgets/custom.styles.dart';
import 'package:metroom/presentation/widgets/custom.text.field.dart';
import 'package:metroom/presentation/widgets/shimmer.effects.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchProductController = TextEditingController();
  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    double _height = MediaQuery.of(context).size.height / 815;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: AppColors.rawSienna,
                      width: 1,
                    ),
                  ),
                  elevation: 6,
                  color: themeFlag ? AppColors.mirage : AppColors.creamColor,
                  child: CustomTextField.customTextField2(
                    hintText: 'Search',
                    inputType: TextInputType.text,
                    textEditingController: searchProductController,
                    validator: (val) => val!.isEmpty ? 'Enter a Search' : null,
                    themeFlag: themeFlag,
                    onChanged: (val) {
                      setState(() {
                        isExecuted = true;
                      });
                    },
                  ),
                ),
              ),
              isExecuted
                  ? searchData(
                      searchContent: searchProductController.text,
                      themeFlag: themeFlag)
                  : Column(
                      children: [
                        SizedBox(
                          height: _height * 290,
                        ),
                        Center(
                          child: Text(
                            'Search Your Room 🔥🤞',
                            style: kBodyText.copyWith(
                              fontSize: _height * 20,
                              fontWeight: FontWeight.bold,
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchData({required String searchContent, required bool themeFlag}) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width,
          child: Consumer<RoomNotifier>(
            builder: (context, notifier, _) {
              return FutureBuilder(
                future: notifier.getSearchRooms(
                  roomName: searchProductController.text.replaceAll(' ', ''),
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ShimmerEffects.loadShimmerFavouriteandSearch(
                        context: context, displayTrash: false);
                  } else {
                    List _snapshot = snapshot.data as List;
                    print(searchProductController.text.replaceAll(' ', ''));
                    if (_snapshot.length == 0 || _snapshot.isEmpty) {
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
                              Navigator.of(context).pushNamed(
                                AppRouter.roomDetailRoute,
                                arguments: RoomScreenArgs(
                                  room_id: roomModel.roomId,
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
    );
  }
}
