import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/home/category_details/cubit/source_state.dart';

class SourceViewModel extends Cubit<SourceState>{

    try{
      emit(SourceLoadingState());
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