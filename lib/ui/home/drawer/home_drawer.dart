import 'package:flutter/material.dart';
import 'package:news_app/Ui/home/Drawer/drawer_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/ui/home/drawer/widget_switch.dart';
import 'package:news_app/utils/assets_maneger.dart';
import 'package:provider/provider.dart';

import '../../../provider/language_provider.dart';
import '../../../provider/theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_style.dart';

class HomeDrawer extends StatefulWidget {
  HomeDrawer({super.key, required this.onDrawerClicked});
  Function onDrawerClicked;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.20,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: Text(AppLocalizations.of(context)!.news_app,
              style: AppStyles.black24bold),
        ),
        InkWell(
          onTap: () {
            widget.onDrawerClicked();
            setState(() {});
          },
          child: DrawerItem(
            imagePath: AssetsManager.homeIcon,
            text: AppLocalizations.of(context)!.go_to_home,
          ),
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.06,
          endIndent: width * 0.06,
        ),
        DrawerItem(
          imagePath: AssetsManager.themeIcon,
          text: AppLocalizations.of(context)!.theme,
        ),
        SwitchWidget(
          text1: AppLocalizations.of(context)!.dark,
          text2: AppLocalizations.of(context)!.light,
          onClicked: () {
            ThemeMode newTheme = themeProvider.appTheme == ThemeMode.dark
                ? ThemeMode.light
                : ThemeMode.dark;
            themeProvider.changeTheme(newTheme);
            setState(() {

            });
          },
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.06,
          endIndent: width * 0.06,
        ),
        DrawerItem(
          imagePath: AssetsManager.languageIcon,
          text: AppLocalizations.of(context)!.language,
        ),
        SwitchWidget(
          text1: AppLocalizations.of(context)!.arabic,
          text2: AppLocalizations.of(context)!.english,
          onClicked: () {
            String newLanguage =
            languageProvider.appLanguage == 'en' ? 'ar' : 'en';
            languageProvider.changeLanguage(newLanguage);
            setState(() {

            });
          },
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