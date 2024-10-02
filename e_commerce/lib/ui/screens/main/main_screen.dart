import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/categories/categories_tab.dart';
import 'package:e_commerce/ui/screens/main/tabs/favourite/favourite_tab.dart';
import 'package:e_commerce/ui/screens/main/tabs/home/home_tab.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/profile_tab.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  static const String routeName = "MainScreen";
  final List<Widget> tabs = [
    HomeTab(),
    CategoryTab(),
    FavouriteTab(),
    ProfileTab(),
  ];
  MainViewModel mainViewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: mainViewModel,
      builder: (context, state) => Scaffold(
        body: tabs[mainViewModel.currentTabIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(canvasColor: AppColors.primaryColor),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.shifting,
     
            currentIndex: mainViewModel.currentTabIndex,
            onTap: (index) {
              mainViewModel.changeSelectedTab(index);
            },
            showSelectedLabels: false,
            items: [
              buildBottomNavigationbarItem(
                  "assets/images/home.png", mainViewModel.currentTabIndex == 0),
              buildBottomNavigationbarItem("assets/images/category.png",
                  mainViewModel.currentTabIndex == 1),
              buildBottomNavigationbarItem("assets/images/favourite.png",
                  mainViewModel.currentTabIndex == 2),
              buildBottomNavigationbarItem("assets/images/profile.png",
                  mainViewModel.currentTabIndex == 3),
            ],
          ),
        ),
      ),
    );
  }

  buildBottomNavigationbarItem(String iconAsset, bool selected) {
    return BottomNavigationBarItem(
        icon: selected
            ? CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                radius: 20,
                child: ImageIcon(
                  AssetImage(iconAsset),
                  size: 30,
                ),
              )
            : ImageIcon(
                AssetImage(iconAsset),
                size: 30,
              ),
        label: "");
  }
}
