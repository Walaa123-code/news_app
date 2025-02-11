import 'package:news_app/utils/assets_maneger.dart';

class CategoryModel{
  String id;
  String title;
  String imagePath;

  CategoryModel({required this.id,
  required this.title,required this.imagePath});

  static List<CategoryModel> getCategoriesList(bool isDark){
    return[
      CategoryModel(id: 'general', title: 'General',
          imagePath: isDark?
          AssetsManager.generalDarkImage:
      AssetsManager.generalLightImage
      ),
      CategoryModel(id: 'business', title: 'Business',
          imagePath: isDark?
          AssetsManager.businessDarkImage:
          AssetsManager.businessLightImage),
      CategoryModel(id: 'sports', title: 'Sports',
          imagePath: isDark?
          AssetsManager.sportDarkImage:
          AssetsManager.sportLightImage),
      CategoryModel(id: 'technology', title: 'Technology',
          imagePath: isDark?
          AssetsManager.technologyDarkImage:
          AssetsManager.technologyLightImage),
      CategoryModel(id: 'entertainment', title: 'Entertainment',
          imagePath: isDark?
          AssetsManager.entertainmentDarkImage:
          AssetsManager.entertainmentLightImage),
      CategoryModel(id: 'health', title: 'Health',
          imagePath: isDark?
          AssetsManager.healthDarkImage:
          AssetsManager.healthLightImage),
      CategoryModel(id: 'science', title: 'Science',
          imagePath: isDark?
          AssetsManager.scienceDarkImage:
          AssetsManager.scienceLightImage),

    ];
  }
}