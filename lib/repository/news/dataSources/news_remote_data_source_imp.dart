import 'package:news_app/ApI/api_manager.dart';

import '../../../model/NewsResponse.dart';
import 'news_remote_data_source.dart';

class RemoteNewsRepositoryImpl implements RemoteNewsRepository{
  ApiManager apiManager;
  RemoteNewsRepositoryImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsBySourceId(sourceId, currentLanguage, page)async {
    var response= await apiManager.getNewsBySourceId(sourceId, currentLanguage, page);
    return response;
  }

}