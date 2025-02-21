

import '../../../model/NewsResponse.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse?> getNewsBySourceId(sourceId, currentLanguage, page);
}