import 'package:evently/event/core/app_assets.dart';
import 'package:evently/event/core/app_colors.dart';
import 'package:evently/event/screens/home/tabs/home_tab/home_tab.dart';
import 'package:evently/event/screens/home/tabs/love_tab/favorites_tab.dart';
import 'package:evently/event/screens/home/tabs/map_tab/map_tab.dart';
import 'package:evently/event/screens/home/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    const HomeTab(),
    const MapTab(),
    FavoritesTab(),
    const ProfileTab(),
  ];
  int currentIndex = 0;

  late AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: buildFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                activeIcon: ImageIcon(AssetImage(AppAssets.homeActive)),
                backgroundColor: AppColors.purple,
                icon: ImageIcon(AssetImage(AppAssets.homeIcon)),
                label: 'home'),
            BottomNavigationBarItem(
                activeIcon: ImageIcon(AssetImage(AppAssets.mapActive)),
                backgroundColor: AppColors.purple,
                icon: ImageIcon(AssetImage(AppAssets.mapIcon)),
                label: 'map'),
            BottomNavigationBarItem(
                activeIcon: ImageIcon(AssetImage(AppAssets.loveActive)),
                backgroundColor: AppColors.purple,
                icon: ImageIcon(AssetImage(AppAssets.loveIcon)),
                label: 'love'),
            BottomNavigationBarItem(
                activeIcon: ImageIcon(AssetImage(AppAssets.profileActive)),
                backgroundColor: AppColors.purple,
                icon: ImageIcon(AssetImage(AppAssets.profileIcon)),
                label: 'profile'),
          ],
        ),
        body: tabs[currentIndex]);
  }

  FloatingActionButton buildFab() {
    return FloatingActionButton(
      onPressed: () {
        // Navigator.pushNamed(context, AddEvent.routeName);
      },
      backgroundColor: AppColors.purple,
      shape: const CircleBorder(
          side: BorderSide(width: 5, color: AppColors.white)),
      child: const Icon(
        Icons.add,
        color: AppColors.white,
        size: 30,
      ),
    );
  }
}