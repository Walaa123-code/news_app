import 'package:news_app/utils/assets_maneger.dart';

class CategoryModel{
  String id;
  String title;
  String imagePath;

  CategoryModel({required this.id,
  required this.title,required this.imagePath});

  static List<CategoryModel> getCategoriesList(){
    return[
      CategoryModel(id: 'sports', title: 'Sports',
          imagePath: AssetsManager.sportDarkImage),
      CategoryModel(id: 'business', title: 'Business',
          imagePath: AssetsManager.businessDarkImage),
      CategoryModel(id: 'health', title: 'Health',
          imagePath: AssetsManager.healthDarkImage),
      CategoryModel(id: 'entertainment', title: 'Entertainment',
          imagePath: AssetsManager.entertainmentDarkImage),
      CategoryModel(id: 'general', title: 'General',
          imagePath: AssetsManager.generalDarkImage),
      CategoryModel(id: 'science', title: 'Science',
          imagePath: AssetsManager.scienceDarkImage),
      CategoryModel(id: 'technology', title: 'Technology',
          imagePath: AssetsManager.technologyDarkImage),

    ];
  }
}