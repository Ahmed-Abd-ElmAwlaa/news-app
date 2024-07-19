import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categories/CategoryWidget.dart';
import 'Category.dart';
typedef OnCategoryClick = void Function(Category category);
class CategoriesFragment extends StatelessWidget {

  OnCategoryClick onCategoryClick;
  CategoriesFragment(this.onCategoryClick, {super.key});
  List<Category> categories = Category.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("pick your category\nof interested\n",
              style: TextStyle(
                  fontSize:22,
                  fontWeight: FontWeight.bold
          ),
          ),
          Expanded(
            child: GridView.builder(gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing:20 ,
              mainAxisSpacing:24
            ),
                itemBuilder: (context,index)=>InkWell(
                onTap: (){
                  onCategoryClick(categories[index]);
                },
                    child: CategoryItem(categories[index], index),
                ),
            itemCount:categories.length),
          )
        ],
      ),
    );
  }
}
