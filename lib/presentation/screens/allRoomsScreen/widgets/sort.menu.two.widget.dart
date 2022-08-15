import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/core/notifiers/sorts.notifier.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';

class SortMenuTwo extends StatefulWidget {
  const SortMenuTwo({Key? key}) : super(key: key);

  @override
  State<SortMenuTwo> createState() => _CustomSortMenuTwo();
}

class _CustomSortMenuTwo extends State<SortMenuTwo> {
  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    var themeFlag = _themeNotifier.darkTheme;
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Icon(
          Icons.settings,
          size: 30,
          color: themeFlag ? AppColors.creamColor : AppColors.mirage,
        ),
        customItemsIndexes: const [4],
        customItemsHeight: 10,
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value as MenuItem);
        },
        itemHeight: 48,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 160,
        dropdownMaxHeight: 250,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: themeFlag ? AppColors.mirage : AppColors.creamColor,
        ),
        dropdownElevation: 8,
        offset: const Offset(0, 8),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [normal, rating, price, amenties];

  static const normal =
      MenuItem(text: 'Default', icon: Icons.arrow_back_ios_new);
  static const rating = MenuItem(text: 'Rating', icon: Icons.rate_review);
  static const price = MenuItem(text: 'Price', icon: Icons.price_change);
  static const amenties = MenuItem(text: 'Amenties', icon: Icons.room_service);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.normal:
        Provider.of<SortNotifier>(context, listen: false).changeNormal();
        break;
      case MenuItems.rating:
        Provider.of<SortNotifier>(context, listen: false).changeByRating();
        break;
      case MenuItems.price:
        Provider.of<SortNotifier>(context, listen: false).changeByPrice();
        break;
      case MenuItems.amenties:
        Provider.of<SortNotifier>(context, listen: false).changeByAmentities();
        break;
    }
  }
}
