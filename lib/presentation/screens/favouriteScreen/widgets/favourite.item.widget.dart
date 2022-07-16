import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/core/models/favourite.model.dart';

class FavouriteItem extends StatelessWidget {
  FavouriteItem(
      {Key? key, this.onTap, required this.favouriteModel, this.onDelete})
      : super(key: key);

  final GestureTapCallback? onTap;
  final GestureTapCallback? onDelete;

  final FavouriteModel favouriteModel;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 815;
    double _width = MediaQuery.of(context).size.width / 375;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _height * 205,
        width: _width * 375,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Stack(
            children: [
              Image.network(
                favouriteModel.rooms.roomPhotos[0],
                fit: BoxFit.cover,
                height: _height * 205,
                width: _width * 375,
              ),
              Container(
                height: _height * 205,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.0, 0.9],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 310,
                top: 2,
                child: IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: _height * 22,
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 20.0,
                        spreadRadius: 4.0,
                      ),
                    ],
                  ),
                  onPressed: onDelete,
                ),
              ),
              Positioned(
                left: 10,
                top: 115,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favouriteModel.rooms.roomName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _height * 12,
                      ),
                    ),
                    Text(
                      favouriteModel.rooms.roomType,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _height * 14,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: _height * 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          ' ${favouriteModel.rooms.roomRating}',
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
                      '₹ ${favouriteModel.rooms.roomPrice.toString()} Per Room',
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
