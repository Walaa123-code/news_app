import 'package:injectable/injectable.dart';
import 'package:news_app/ApI/api_manager.dart';
import 'package:news_app/repository/sources/dataSources/source_remote_data_source.dart';

import '../../../model/SourceResponse.dart';

@Injectable(as: SourceRemoteDataSource)
class SourceRemoteDatasourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager;
  SourceRemoteDatasourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId,String currentLanguage)async {
    var  response= await apiManager.getSources(categoryId, currentLanguage);
    return response;
  }
}