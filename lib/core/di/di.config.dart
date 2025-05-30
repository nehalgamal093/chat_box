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
import '../../features/auth/data/data_source/remote_ds/auth_remote_ds_impl.dart'
    as _i541;
import '../../features/auth/data/repository/auth_repo_impl.dart' as _i751;
import '../../features/auth/domain/repository/auth_repo.dart' as _i976;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i1012;
import '../../features/auth/domain/use_cases/register_usecase.dart' as _i957;
import '../../features/auth/presentation/screens/login/bloc/login_bloc.dart'
    as _i971;
import '../../features/auth/presentation/screens/register/bloc/register_bloc.dart'
    as _i763;
import '../../features/chat/data/data_source/remote_ds/chat_remote_ds.dart'
    as _i458;
import '../../features/chat/data/data_source/remote_ds/chat_remote_ds_impl.dart'
    as _i454;
import '../../features/chat/data/repository/chat_repo_impl.dart' as _i67;
import '../../features/chat/domain/repository/chat_repo.dart' as _i359;
import '../../features/chat/domain/use_cases/chat_use_case.dart' as _i1039;
import '../../features/chat/domain/use_cases/send_message_usecase.dart'
    as _i703;
import '../../features/chat/presentation/bloc/socket_bloc.dart' as _i16;
import '../../features/friends/data/data_source/remote_data_source/friends_remote_ds.dart'
    as _i68;
import '../../features/friends/data/data_source/remote_data_source/friends_remote_ds_impl.dart'
    as _i740;
import '../../features/friends/data/repository/friends_repo_impl.dart' as _i320;
import '../../features/friends/domain/repository/friends_repo.dart' as _i661;
import '../../features/friends/domain/usecases/get_friends_usecase.dart'
    as _i119;
import '../../features/friends/presentation/bloc/friends_bloc.dart' as _i1033;
import '../network/api_manager/api_manager.dart' as _i576;
import '../resources/socket/socket_service.dart' as _i439;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i439.SocketService>(() => _i439.SocketService());
    gh.lazySingleton<_i576.APIManager>(() => _i576.APIManager());
    gh.factory<_i458.ChatRemoteDs>(
      () => _i454.ChatRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i843.AuthRemoteDs>(
      () => _i541.AuthRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i68.FriendsRemoteDs>(
      () => _i740.FriendsRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i359.ChatRepo>(
      () => _i67.ChatRepoImpl(gh<_i458.ChatRemoteDs>()),
    );
    gh.factory<_i976.AuthRepo>(
      () => _i751.AuthRepoImpl(gh<_i843.AuthRemoteDs>()),
    );
    gh.factory<_i661.FriendsRepo>(
      () => _i320.FriendsRepoImpl(gh<_i68.FriendsRemoteDs>()),
    );
    gh.factory<_i1039.ChatUseCase>(
      () => _i1039.ChatUseCase(gh<_i359.ChatRepo>()),
    );
    gh.factory<_i703.SendMessageUseCase>(
      () => _i703.SendMessageUseCase(gh<_i359.ChatRepo>()),
    );
    gh.factory<_i119.GetFriendsUseCase>(
      () => _i119.GetFriendsUseCase(gh<_i661.FriendsRepo>()),
    );
    gh.factory<_i1033.FriendsBloc>(
      () => _i1033.FriendsBloc(gh<_i119.GetFriendsUseCase>()),
    );
    gh.factory<_i16.SocketBloc>(
      () => _i16.SocketBloc(
        gh<_i439.SocketService>(),
        gh<_i1039.ChatUseCase>(),
        gh<_i703.SendMessageUseCase>(),
      ),
    );
    gh.factory<_i1012.LoginUseCase>(
      () => _i1012.LoginUseCase(gh<_i976.AuthRepo>()),
    );
    gh.factory<_i957.RegisterUseCase>(
      () => _i957.RegisterUseCase(gh<_i976.AuthRepo>()),
    );
    gh.factory<_i763.RegisterBloc>(
      () => _i763.RegisterBloc(gh<_i957.RegisterUseCase>()),
    );
    gh.factory<_i971.LoginBloc>(
      () => _i971.LoginBloc(gh<_i1012.LoginUseCase>()),
    );
    return this;
  }
}
