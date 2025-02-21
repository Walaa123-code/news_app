import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../ApI/api_manager.dart' as _i647;
import '../repository/sources/dataSources/source_offline_data_source.dart' as _i462 ;
import '../repository/sources/dataSources/source_offline_data_source_imp.dart' as _i428 ;
import '../repository/sources/dataSources/source_remote_data_source.dart' as _i455;
import '../repository/sources/dataSources/source_remote_data_source_imp.dart' as _i763;
import '../repository/sources/repository/source_repository.dart' as _i949;
import '../repository/sources/repository/source_repository_imp.dart' as _i892;
import '../ui/home/category_details/cubit/source_view_model.dart' as _i254;


extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i647.ApiManager>(() => _i647.ApiManager.getInstance());
    gh.factory<_i462.OfflineSourceDataSource>(
            () => _i428.OfllineSourceDtaSourceImpl());
    gh.factory<_i455.SourceRemoteDataSource>(() =>
        _i763.SourceRemoteDatasourceImpl(apiManager: gh<_i647.ApiManager>()));
    gh.factory<_i949.SourceRepository>(() => _i892.SourceRepositoryImpl(
      sourceRemoteDataSource: gh<_i455.SourceRemoteDataSource>(),
      offlineDataSource: gh<_i462.OfflineSourceDataSource>(),
    ));
    gh.factory<_i254.SourceViewModel>(() =>
        _i254.SourceViewModel(sourceRepository: gh<_i949.SourceRepository>()));
    return this;
  }
}