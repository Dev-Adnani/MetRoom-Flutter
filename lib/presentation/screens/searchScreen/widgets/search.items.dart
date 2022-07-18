import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/core/models/room.model.dart';

class SearchItem extends StatelessWidget {
  SearchItem({Key? key, this.onTap, required this.roomModel}) : super(key: key);

  final GestureTapCallback? onTap;
  final RoomModel roomModel;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 815;
    double _width = MediaQuery.of(context).size.width / 375;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _height * 205,
        width: _width * 375,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Stack(
            children: [
              Image.network(
                roomModel.roomPhotos[0],
                fit: BoxFit.cover,
                height: _height * 205,
                width: _width * 375,
              ),
              Container(
                height: _height * 205,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.2, 0.9],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _height * 14,
                      ),
                    ),
                    Text(
                      roomModel.roomType,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _height * 12,
                      ),
                    ),
                    Text(
                      roomModel.roomAddress,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _height * 12,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.yellowish,
                          size: _height * 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          roomModel.roomRating.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _height * 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '₹ ${roomModel.roomPrice.toString()} Per Room',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.yellowish,
                        fontSize: _height * 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
