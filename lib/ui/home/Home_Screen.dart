import 'package:flutter/material.dart';
import 'package:news_app/ui/home/settings/SettingsFragment.dart';
import 'HomeDrawer.dart';
import 'categories/CategoriesFragment.dart';
import 'categories/Category.dart';
import 'categories/categoryDetails/CategoryDetails.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName ="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFragment = CategoriesFragment(onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/bkg.png",),
          fit: BoxFit.cover
        )
      ),
        child: Scaffold(
          drawer: HomeDrawer(onMenuItemClick),
          appBar: AppBar(
            title: const Text("News App"),
          ),
          body:selectedFragment,
        )
    );
  }

 late Widget selectedFragment;

  void onMenuItemClick(MenuItem item){
    Navigator.pop(context);
    switch(item){
      case MenuItem.categories:
        selectedFragment = CategoriesFragment(onCategoryItemClick);
        break;
      case MenuItem.settings:
        selectedFragment = const SettingsFragment();
    }
    setState(() {});
  }
  void onCategoryItemClick(Category category){
    selectedFragment =CategoryDetails(category);
    setState(() {});
  }

}
