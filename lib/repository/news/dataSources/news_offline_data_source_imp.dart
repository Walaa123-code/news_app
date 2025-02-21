import 'package:hive/hive.dart';

import '../../../model/NewsResponse.dart';
import 'news_offline_data_source.dart';

class OfflineNewsDataSourceImpl  implements OfflineNewsDataSource{
  @override
  Future<NewsResponse?> getNewsBySourceId(sourceId, currentLanguage, page)async {
    // TODO: read data
    var box= await Hive.openBox("news ");
    var news= NewsResponse.fromJson(box.get(sourceId));
    return news;
    // throw UnimplementedError();
  }

  @override
  void saveNews(NewsResponse newsResponse, String sourceId) async{
    // TODO: write data
    var box= await Hive.openBox("news ");
    await box.put(sourceId, newsResponse.toJson());
    await box.close();


  }

}