import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/presentation/screens/roomScreen/widgets/image.slider.dart';
import 'package:metroom/presentation/screens/roomScreen/widgets/room.footer.dart';

Widget buildRoomData({
  required BuildContext context,
  required RoomModel roomModel,
  required themeFlag,
}) {
  return Column(
    children: [
      imageSlider(roomModel: roomModel, context: context),
      Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        decoration: BoxDecoration(
          color: themeFlag ? AppColors.mirage : AppColors.creamColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(100),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    roomModel.roomName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                  Text(
                    "\₹ ${roomModel.roomPrice.toString()}",
                    style: TextStyle(
                        color: AppColors.yellowish,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_city,
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        roomModel.roomAddress,
                        style: TextStyle(
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "per night",
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: MediaQuery.of(context).size.height * 0.08,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            ),
                            Text(
                              roomModel.roomRating.toString(),
                              style: TextStyle(
                                color: themeFlag
                                    ? AppColors.mirage
                                    : AppColors.creamColor,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "10 reviews",
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.mirage
                                : AppColors.creamColor,
                          ),
                        )
                      ],
                    ),
                    // Here
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "What they offer",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                itemCount: roomModel.roomAmenitiesImages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Card(
                    elevation: 5,
                    shadowColor: AppColors.yellowish,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            roomModel.roomAmenitiesImages[index],
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            roomModel.roomAmenitiesText[index],
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
            ),
            Text(
              roomModel.roomDescription,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RoomFooter(
             roomModel: roomModel,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    ],
  );
}
