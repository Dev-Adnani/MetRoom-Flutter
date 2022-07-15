import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

Widget BottomNav(
    {required int index,
    required PageController controller,
    required bool themeFlag}) {
  return Container(
    decoration: BoxDecoration(
      color: themeFlag ? AppColors.mirage : AppColors.creamColor,
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: SalomonBottomBar(
        currentIndex: index,
        onTap: (val) {
          index = val;
          controller.jumpToPage(val);
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            unselectedColor:
                themeFlag ? AppColors.creamColor : AppColors.mirage,
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            unselectedColor:
                themeFlag ? AppColors.creamColor : AppColors.mirage,
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favourite"),
            unselectedColor:
                themeFlag ? AppColors.creamColor : AppColors.mirage,
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.pin_drop_sharp),
            title: Text("Near By"),
            unselectedColor:
                themeFlag ? AppColors.creamColor : AppColors.mirage,
            selectedColor: Colors.blueAccent,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text("Setting"),
            unselectedColor:
                themeFlag ? AppColors.creamColor : AppColors.mirage,
            selectedColor: Colors.teal,
          ),
        ],
      ),
    ),
  );
}
