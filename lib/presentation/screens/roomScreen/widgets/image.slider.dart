import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/notifiers/favourite.notifier.dart';
import 'package:metroom/presentation/widgets/custom.snackbar.dart';
import 'package:provider/provider.dart';

Widget imageSlider(
    {required RoomModel roomModel, required BuildContext context}) {
  AuthenticationNotifer _auth =
      Provider.of<AuthenticationNotifer>(context, listen: true);
  return Container(
    height: MediaQuery.of(context).size.width - 50,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Swiper(
          itemCount: roomModel.roomPhotos.length,
          pagination: const SwiperPagination(
            builder: SwiperPagination.dots,
          ),
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              roomModel.roomPhotos[index],
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          right: 10,
          bottom: -20,
          child: InkWell(
            onTap: () async {
              var data =
                  await Provider.of<FavouriteNotifier>(context, listen: false);
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
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.pink.shade400,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
