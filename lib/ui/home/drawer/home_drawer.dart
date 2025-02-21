import 'package:flutter/material.dart';
import 'package:news_app/utils/assets_maneger.dart';


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.20,
          color: AppColors.whiteColor,
        ),
        InkWell(
          onTap: () {
          },
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.06,
          endIndent: width * 0.06,
        ),
        ),
        ),
          color: AppColors.whiteColor,
        ),

        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.06,
          endIndent: width * 0.06,
        ),
      ],
    );
  }
}