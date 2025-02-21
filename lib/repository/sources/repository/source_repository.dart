
//todo:interface

import '../../../model/SourceResponse.dart';

abstract class  SourceRepository{
 Future<SourceResponse?>getSources(String categoryId,String currentLanguage);
}