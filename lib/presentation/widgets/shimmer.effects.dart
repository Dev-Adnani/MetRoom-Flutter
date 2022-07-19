import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffects {
  static final Color _shimmerColor = Colors.grey[200]!;
  static final Color _shimmerColorDark = Colors.grey[500]!;

  static loadShimmerHome({required BuildContext context}) {
    double _height = MediaQuery.of(context).size.height / 815;

    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: _height * 280,
          width: 220,
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: _shimmerColor,
                  highlightColor: _shimmerColorDark,
                  child: Container(
                    height: _height * 280,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 4,
                  child: Shimmer.fromColors(
                    baseColor: _shimmerColor,
                    highlightColor: Colors.black,
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      size: _height * 25,
                      color: Colors.red,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static loadShimmerEvent({required BuildContext context}) {
    double _height = MediaQuery.of(context).size.height / 815;
    double _width = MediaQuery.of(context).size.width / 375;

    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: _height * 205,
          width: _width * 375,
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: _shimmerColor,
                  highlightColor: _shimmerColorDark,
                  child: Container(
                    height: _height * 205,
                    width: _width * 375,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static loadShimmerFavouriteandSearch({
    required BuildContext context,
    required bool displayTrash,
  }) {
    double _height = MediaQuery.of(context).size.height / 815;
    double _width = MediaQuery.of(context).size.width / 375;
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: _height * 190,
          width: _width * 375,
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: _shimmerColor,
                  highlightColor: _shimmerColorDark,
                  child: Container(
                    height: _height * 190,
                    width: _width * 375,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),  
                      color: Colors.white,
                    ),
                  ),
                ),
                displayTrash
                    ? Positioned(
                        left: 310,
                        top: 4,
                        child: Shimmer.fromColors(
                          baseColor: _shimmerColor,
                          highlightColor: Colors.black,
                          child: Icon(
                            Icons.delete,
                            size: _height * 25,
                            color: Colors.red,
                          ),
                        ),
                      )
                    : SizedBox(),
                Positioned(
                  left: 10,
                  top: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: _shimmerColor,
                        highlightColor: Colors.black,
                        child: Container(
                          height: _height * 10,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static loadBookingItem({required BuildContext context}) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        double _width = MediaQuery.of(context).size.width / 375;
        double _height = MediaQuery.of(context).size.height / 815;

        return Padding(
          padding: const EdgeInsets.fromLTRB(27, 5, 27, 0),
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Shimmer.fromColors(
                      baseColor: _shimmerColor,
                      highlightColor: Colors.black,
                      child: Container(
                        width: _width * 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadowColor.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Container(
                            height: 80,
                            width: 70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5, bottom: 5),
                            child: Shimmer.fromColors(
                              baseColor: _shimmerColor,
                              highlightColor: Colors.black,
                              child: Container(
                                height: _height * 10,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 6, top: 2, bottom: 5),
                            child: Shimmer.fromColors(
                              baseColor: _shimmerColor,
                              highlightColor: Colors.black,
                              child: Container(
                                height: _height * 10,
                                width: 95,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 6, top: 2, bottom: 5),
                            child: Shimmer.fromColors(
                              baseColor: _shimmerColor,
                              highlightColor: Colors.black,
                              child: Container(
                                height: _height * 10,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6, top: 2),
                            child: Shimmer.fromColors(
                              baseColor: _shimmerColor,
                              highlightColor: Colors.black,
                              child: Container(
                                height: _height * 10,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
