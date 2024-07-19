import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categories/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;
  CategoryItem(this.category,this.index,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius:BorderRadius.only(
          topRight:const Radius.circular(24) ,
          topLeft:const Radius.circular(24),
          bottomLeft: Radius.circular(index.isEven?24:0),
          bottomRight:Radius.circular(index.isOdd?24:0)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/images/${category.imageName}",
              height: 120),
          Text(category.title,
            style: const TextStyle(
            fontSize: 24,
            color: Colors.white
          ),)
        ],
      ),
    );
  }
}
