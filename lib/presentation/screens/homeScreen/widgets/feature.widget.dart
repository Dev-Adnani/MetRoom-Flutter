import 'package:flutter/material.dart';
import 'package:metroom/core/models/room.model.dart';

class FeatureRooms extends StatelessWidget {
  FeatureRooms(
      {Key? key, this.onTap, this.onTapFavorite, required this.roomModel})
      : super(key: key);

  final RoomModel roomModel;
  final GestureTapCallback? onTapFavorite;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 815;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _height * 280,
        width: 220,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Stack(
            children: [
              Image.network(
                roomModel.roomPhotos[0],
                fit: BoxFit.cover,
                height: _height * 280,
                width: 220,
              ),
              Container(
                height: _height * 280,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.5, 0.8],
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
                left: 15,
                top: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _height * 14,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      child: Text(
                        roomModel.roomAddress,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _height * 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 140,
                top: 3,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_outline_rounded,
                    size: _height * 25,
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 4.0,
                      ),
                    ],
                  ),
                  onPressed: onTapFavorite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
