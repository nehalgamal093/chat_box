// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/remote_ds/auth_remote_ds.dart'
    as _i843;
import '../../features/auth/data/data_source/remote_ds/AuthRemoteDsImpl.dart'
    as _i980;
import '../../features/auth/data/repository/auth_repo_impl.dart' as _i751;
import '../../features/auth/domain/repository/auth_repo.dart' as _i976;
import '../../features/auth/domain/use_cases/register_usecase.dart' as _i957;
import '../../features/auth/presentation/screens/register/bloc/register_bloc.dart'
    as _i763;
import '../network/api_manager/api_manager.dart' as _i576;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i576.APIManager>(() => _i576.APIManager());
    gh.factory<_i843.AuthRemoteDs>(
      () => _i980.AuthRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i976.AuthRepo>(
      () => _i751.AuthRepoImpl(gh<_i843.AuthRemoteDs>()),
    );
    gh.factory<_i957.RegisterUseCase>(
      () => _i957.RegisterUseCase(gh<_i976.AuthRepo>()),
    );
    gh.factory<_i763.RegisterBloc>(
      () => _i763.RegisterBloc(gh<_i957.RegisterUseCase>()),
    );
    return this;
  }
}
