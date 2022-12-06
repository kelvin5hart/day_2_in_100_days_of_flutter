import 'package:day_2_in_100_days_of_flutter/screens/drawer_screen.dart';
import 'package:day_2_in_100_days_of_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../model/menu_item_model.dart';

class ZoomDrawerScreen extends StatefulWidget {
  const ZoomDrawerScreen({Key? key}) : super(key: key);

  @override
  State<ZoomDrawerScreen> createState() => _ZoomDrawerScreenState();
}

class _ZoomDrawerScreenState extends State<ZoomDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    MenuDrawerItem currentItem = MenuItems.categories;
    return ZoomDrawer(
      menuBackgroundColor: const Color(0xFF09225E),
      angle: 0,
        menuScreen: DrawerScreen(
            currentItem: currentItem,
          onSelectedItem: (item){
              setState(() => currentItem = item);
        }
        ), mainScreen: const HomeScreen(

    ));
  }
}
