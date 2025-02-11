import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../model/category_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_style.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryModel.getCategoriesList(true);
  Function onViewAllClick;
  CategoryFragment({required this.onViewAllClick});
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryList = [];
    /*
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var isDarkTheme=Theme.of(context).brightness==Brightness.dark;
      categoryList = CategoryModel.getCategoriesList(context,themeProvider.isDark());
  */
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.03,
        horizontal: width * 0.03,
      ),
      child: categoryList.isEmpty
          ? Center(
              child: Text(
                "No category",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Good Morning\nHere is Some News For You',
                  style: AppStyles.medium24white,
                ),
                SizedBox(
                  height: height * .02,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      // التحقق من وجود الصورة
                      /*
                      String? imagePath = isDarkTheme
                          ? categoryList[index].imageDarkPath
                          :categoryList[index].imageLightPath;
                          */

                      return Stack(
                        alignment: index % 2 == 0
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              categoryList[index].imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: height * 0.02,
                              left: width * 0.02,
                              right: width * 0.02,
                            ),
                            child: ToggleSwitch(
                                animate: true,
                                customWidths: const [90.0, 50.0],
                                cornerRadius: 40.0,
                                activeBgColors: const [
                                  [AppColors.grayColor, AppColors.grayColor],
                                  [AppColors.grayColor, AppColors.grayColor],
                                ],
                                activeFgColor: Colors.white,
                                inactiveBgColor: AppColors.grayColor,
                                inactiveFgColor: Colors.white,
                                initialLabelIndex: 1,
                                totalSwitches: 2,
                                customWidgets: [
                                  Text('view All',
                                      style: AppStyles.bold16white),
                                  const CircleAvatar(
                                    backgroundColor: AppColors.blackColor,
                                    radius: 60,
                                    child: Icon(
                                        color: AppColors.whiteColor,
                                        Icons.arrow_forward_ios_outlined),
                                  )
                                ],
                                icons: const [
                                  null,
                                  Icons.arrow_forward_ios_outlined,
                                ],
                                /*
                        onToggle: (index1) {
                          if (widget.onViewAllClick != null) {
                            widget.onViewAllClick(categoryList[index]);
                          }
                        },

                         */

                                onToggle: (index1) {
                                  print('switched to: $index');
                                  onViewAllClick(categoryList[index]);
                                }),
                          ),
                        ],
                      );
                    },
                    itemCount: categoryList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: height * 0.02);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
