import 'package:flutter/material.dart';
import 'package:news_app/ui/home/drawer/drawer_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:news_app/utils/assets_maneger.dart';

class HomeDrawer extends StatelessWidget {
  Function onDrawerItemClicked;
  HomeDrawer({required this.onDrawerItemClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: height*0.20,
          color: AppColors.whiteColor,
          child: Text('News App',
          style: AppStyles.bold24Black,),
        ),
        InkWell(
          onTap: (){
            //todo go to home
            onDrawerItemClicked();
          },
            child:
        DrawerItem(imagePath: AssetsManager.homeIcon, text: 'Go To Home')),
        SizedBox(height: height*0.01),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width*0.06,
          endIndent: width*0.06,
        ),
        SizedBox(height: height*0.01),
        DrawerItem(imagePath: AssetsManager.themeIcon, text: 'Theme'),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: width*0.04,
            vertical: height*0.01,
          ),
          padding:  EdgeInsets.symmetric(
            horizontal: width*0.04,
            vertical: height*0.01,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: AppColors.whiteColor,
                  width: 2
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark',
              style: AppStyles.medium20white),
              const Icon(Icons.arrow_drop_down,
              color: AppColors.whiteColor)
            ],

          ),
        ),
        SizedBox(height: height*0.01),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width*0.06,
          endIndent: width*0.06,
        ),
        SizedBox(height: height*0.01,),
        DrawerItem(imagePath: AssetsManager.languageIcon, text: 'Language'),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: width*0.04,
            vertical: height*0.01,
          ),
          padding:  EdgeInsets.symmetric(
            horizontal: width*0.04,
            vertical: height*0.02,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: AppColors.whiteColor,
                  width: 2
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('English',
                  style: AppStyles.medium20white),
              const Icon(Icons.arrow_drop_down,
                  color: AppColors.whiteColor)
            ],

          ),
        ),


      ],
    );
  }
}
