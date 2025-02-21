import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/SourceResponse.dart';
import '../../model/category__model.dart';
import '../../provider/language_provider.dart';
import '../../utils/app_colors.dart';
import 'Drawer/home_drawer.dart';
import 'category_details/category_details.dart';
import 'category_details/category_fragment.dart';
import 'news/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<Source> sourceList = [];
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    String currentLanguage = languageProvider.appLanguage;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            selectedCategory==null ?
            "home": selectedCategory!.title,
            style:Theme.of(context).textTheme.labelLarge),
        actions: [
          SearchBarr(sourceList: sourceList, sourceNumber: selectedIndex,),
        ],

      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child:  HomeDrawer(onDrawerClicked: onDrawerClicked,),
      ),
      body: selectedCategory==null?
      CategoryFragment(onViewAllClick:onViewAllClick ,):
      CategoryDetails(category: selectedCategory!,)
      ,
    );
  }
  CategoryModel? selectedCategory;
  void onViewAllClick(CategoryModel newSelectedCategory){
    selectedCategory=newSelectedCategory;
    setState(() {

    });
  }

  void  onDrawerClicked() {
    selectedCategory=null;
    Navigator.of(context).pop();
    setState(() {

    });
  }
}