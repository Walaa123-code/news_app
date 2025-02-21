/*
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/sources/repository/dataSources/source_remote_data_source.dart';

class SourceRemoteDataSourceImp implements SourceRemoteDataSource{
  ApiManager apiManager;
  SourceRemoteDataSourceImp({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    var response = await apiManager.getSources(categoryId);
    return response;
  }

}

 */