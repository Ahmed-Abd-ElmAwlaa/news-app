import 'package:flutter/material.dart';
typedef OnMenuItemClick = void Function(MenuItem clickedItem);
class HomeDrawer extends StatelessWidget {
  OnMenuItemClick onMenuItemClick;
   HomeDrawer(this.onMenuItemClick,{super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 48),
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              child: const Text("News App",style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            ),
            InkWell(
              onTap: (){
                onMenuItemClick(MenuItem.categories);
              },
              child: const Row(
                children: [
                  Icon(Icons.list,size: 32),
                  Text("Categories",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),)
                ],
              ),
            ),
            const SizedBox(height:12,),
            InkWell(
              onTap:(){
                onMenuItemClick(MenuItem.settings);
              } ,
              child: const Row(
                children: [
                  Icon(Icons.settings,size: 32),
                  Text("Settings",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
enum MenuItem{
  categories,
  settings
}
