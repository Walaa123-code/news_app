

import '../../../model/NewsResponse.dart';

abstract class RemoteNewsRepository {
 Future<NewsResponse?> getNewsBySourceId(sourceId, currentLanguage, page);
}