import 'package:day_2_in_100_days_of_flutter/model/menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuItems {
  static var categories =
      MenuDrawerItem(name: "Categories", icon: Icons.bookmark_outline_sharp);
  static var analytics =
      MenuDrawerItem(name: "Analytics", icon: Icons.analytics_outlined);
  static var settings = MenuDrawerItem(name: "Settings", icon: Icons.settings);

  static var all = <MenuDrawerItem>[categories, analytics, settings];
}

class DrawerScreen extends StatelessWidget {
  const DrawerScreen(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  final MenuDrawerItem currentItem;
  final ValueChanged<MenuDrawerItem> onSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09225E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              const CircleAvatar(
                radius: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Kelvin Hart",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50),
              ),
              const SizedBox(
                height: 20,
              ),
              ...MenuItems.all
                  .map((e) => ListTile(
                        selected: currentItem == e,
                        selectedTileColor: Colors.black26,
                        minLeadingWidth: 20,
                        leading: Icon(
                          e.icon,
                          color: const Color(0xFF91A0C1),
                        ),
                        title: Text(
                          e.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        onTap: () => onSelectedItem(e),
                      ))
                  .toList(),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
