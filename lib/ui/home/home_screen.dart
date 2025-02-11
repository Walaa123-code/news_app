import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/category_details/category_details.dart';
import 'package:news_app/utils/app_colors.dart';

import 'category_details/category_fragment.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ?
          'Home':
              selectedCategory!.title,
        style: Theme.of(context).textTheme.labelLarge,),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onDrawerItemClicked: onDrawerItemClicked,),
      ),
      body: selectedCategory==null?
      CategoryFragment(onViewAllClick:onViewAllClicked ,):
      CategoryDetails(category: selectedCategory!,)
      ,
    );
  }

  CategoryModel? selectedCategory;

  void onViewAllClicked(CategoryModel newSelectedCategory){
    //todo: newSelectedCategory => user select
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }
  void onDrawerItemClicked(){
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
