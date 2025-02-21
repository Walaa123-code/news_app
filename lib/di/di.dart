import 'package:news_app/ApI/api_manager.dart';

import '../repository/news/dataSources/news_offline_data_source.dart';
import '../repository/news/dataSources/news_offline_data_source_imp.dart';
import '../repository/news/dataSources/news_remote_data_source.dart';
import '../repository/news/dataSources/news_remote_data_source_imp.dart';
import '../repository/news/repository/news_repository_contract.dart';
import '../repository/news/repository/news_repository_imp.dart';
import '../repository/sources/dataSources/source_offline_data_source.dart';
import '../repository/sources/dataSources/source_offline_data_source_imp.dart';
import '../repository/sources/dataSources/source_remote_data_source.dart';
import '../repository/sources/dataSources/source_remote_data_source_imp.dart';
import '../repository/sources/repository/source_repository.dart';
import '../repository/sources/repository/source_repository_imp.dart';

SourceRepository injectRepositorySourceResponse() {
  return SourceRepositoryImpl(
    sourceRemoteDataSource: injectRepositorySourceRemoteDataSource(),
    offlineDataSource: injectOfflineDataSource(),
  );
}

SourceRemoteDataSource injectRepositorySourceRemoteDataSource() {
  return SourceRemoteDatasourceImpl(apiManager: ApiManager.getInstance());
}

OfflineSourceDataSource injectOfflineDataSource() {
  return OfllineSourceDtaSourceImpl();
}


NewsRepositoryContract injectRepositoryNewsResponse() {
  return NewsRepositoryImpl(remoteNewsRepository: injectNewsRemoteDataSource(), offlineNewsDataSource:injectOfflineNewsDataSource());
}
OfflineNewsDataSource injectOfflineNewsDataSource(){
  return OfflineNewsDataSourceImpl();
}

RemoteNewsRepository injectNewsRemoteDataSource() {
  return RemoteNewsRepositoryImpl(apiManager: ApiManager.getInstance());
}