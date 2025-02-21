import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/repository/sources/dataSources/source_offline_data_source.dart';

import '../../../model/SourceResponse.dart';

@Injectable(as:  OfflineSourceDataSource)
class OfllineSourceDtaSourceImpl implements OfflineSourceDataSource{
  @override
  Future<SourceResponse?> getSources(String categoryId, String currentLanguage)async {
    // TODO: read data
    var box=await Hive.openBox("Source Tab");
    var sourceTab= box.get(categoryId);
    return sourceTab;
    //throw UnimplementedError();
  }

  @override
  void saveSources(SourceResponse? sourceResponse,String categoryId)async {
    // TODO: write data
    var box= await Hive.openBox("Source Tab");
    await box.put(categoryId, sourceResponse);
    await box.close();

  }

}