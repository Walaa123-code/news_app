import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';

class DrawerItem extends StatelessWidget {
String imagePath;
String text;
DrawerItem({required this.imagePath,
required this.text});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.04,
      vertical: height*0.01),
      child: Row(
        children: [
          ImageIcon(AssetImage(imagePath),
          color: AppColors.whiteColor,),
          SizedBox(width: width*0.02,),
          Text(text,
          style: AppStyles.bold20white,)
        ],
      ),
    );
  }
}
