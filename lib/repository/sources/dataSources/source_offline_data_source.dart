

import '../../../model/SourceResponse.dart';

abstract class OfflineSourceDataSource{
 Future<SourceResponse?> getSources (String categoryId,String currentLanguage);
 void saveSources(SourceResponse?  sourceResponse,String categoryId);
}