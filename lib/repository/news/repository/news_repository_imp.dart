import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/repository/news/repository/news_repository_contract.dart';

import '../../../model/NewsResponse.dart';
import '../dataSources/news_offline_data_source.dart';
import '../dataSources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepositoryContract {
  RemoteNewsRepository remoteNewsRepository;
  OfflineNewsDataSource offlineNewsDataSource;
  NewsRepositoryImpl(
      {required this.remoteNewsRepository,
        required this.offlineNewsDataSource});
  @override
  Future<NewsResponse?> getNewsBySourceId(
      sourceId, currentLanguage, page) async {
    final List<ConnectivityResult> connectivityResult =
    await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        (connectivityResult.contains(ConnectivityResult.mobile))) {
      var newsResponse = await remoteNewsRepository.getNewsBySourceId(
          sourceId, currentLanguage, page);
      offlineNewsDataSource.saveNews(newsResponse!, sourceId);
      return newsResponse;
    } else {
      var newsResponse = offlineNewsDataSource.getNewsBySourceId(
          sourceId, currentLanguage, page);
      return newsResponse;
    }
  }
}