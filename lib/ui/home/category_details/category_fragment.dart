import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/app_style.dart';

class CategoryFragment extends StatelessWidget {
var categoryList = CategoryModel.getCategoriesList();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.02,
        vertical: height*0.02
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Good Morning\nHere is Some News For You',
          style: AppStyles.medium24white,),
          ListView.builder(
              itemBuilder: (context, index){
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(categoryList[index].imagePath),
                    )
                  ],
                );
              },
            itemCount: 7,
              )
        ],
      ),
    );
  }
}
