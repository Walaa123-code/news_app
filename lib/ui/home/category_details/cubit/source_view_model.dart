import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/ui/home/category_details/cubit/source_state.dart';

import '../../../../repository/sources/repository/source_repository.dart';

@injectable
class SourceViewModel extends Cubit<SourceState>{
  late SourceRepository sourceRepository;

  SourceViewModel({required this.sourceRepository}):super(SourceLoadingState());

  void getSources(String categoryId, currentLanguage)async{
    try{
      emit(SourceLoadingState());
      var response= await sourceRepository.getSources(categoryId, currentLanguage);
      if(response?.status=="error"){
        emit(SourceErrorState(errorMessage: response!.message!));
        return ;

      }
      if(response?.status=="ok"){
        emit(SourceSuccessState(sourceList: response!.sources!));
        return;
      }
    }catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));
    }

  }
}