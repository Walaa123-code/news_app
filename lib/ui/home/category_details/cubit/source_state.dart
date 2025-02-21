abstract class SourceState {}
class SourceLoadingState extends SourceState{}
class SourceErrorState extends SourceState{
  SourceErrorState({required this.errorMessage});
}
class SourceSuccessState extends SourceState{
  SourceSuccessState({required this.sourceList});
}