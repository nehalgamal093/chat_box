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
import '../../features/friends_requests/data/data_source/remote_data_source/friend_request_remote_ds.dart'
    as _i753;
import '../../features/friends_requests/data/data_source/remote_data_source/friend_request_remote_ds_impl.dart'
    as _i1028;
import '../../features/friends_requests/data/repository/friend_requests_repo_impl.dart'
    as _i472;
import '../../features/friends_requests/domain/repository/friend_requests_repo.dart'
    as _i943;
import '../../features/friends_requests/domain/use_cases/friend_requests_use_case.dart'
    as _i230;
import '../../features/friends_requests/presentation/bloc/friend_requests_bloc/friend_requests_bloc.dart'
    as _i847;
import '../../features/messages/data/data_source/remote_data_source/chatted_users_remote_ds.dart'
    as _i726;
import '../../features/messages/data/data_source/remote_data_source/chatted_users_remote_ds_impl.dart'
    as _i315;
import '../../features/messages/data/repository/chatted_users_repo_impl.dart'
    as _i358;
import '../../features/messages/domain/repository/chatted_users_repo.dart'
    as _i45;
import '../../features/messages/domain/use_cases/chatted_users_usecase.dart'
    as _i1068;
import '../../features/messages/presentation/bloc/chatted_users_bloc.dart'
    as _i806;
import '../../features/search/data/data_source/remote_ds/search_remote_ds.dart'
    as _i47;
import '../../features/search/data/data_source/remote_ds/search_remote_ds_impl.dart'
    as _i568;
import '../../features/search/data/repository/search_repo_impl.dart' as _i175;
import '../../features/search/domain/repository/search_repo.dart' as _i858;
import '../../features/search/domain/use_cases/search_use_case.dart' as _i601;
import '../../features/search/presentation/bloc/search_bloc/search_bloc.dart'
    as _i211;
import '../../features/user_profile/data/data_source/remote_data_source/user_profile_remote_ds.dart'
    as _i820;
import '../../features/user_profile/data/data_source/remote_data_source/user_profile_remote_ds_impl.dart'
    as _i190;
import '../../features/user_profile/data/repository/user_profile_repo_impl.dart'
    as _i940;
import '../../features/user_profile/domain/repository/user_profile_repo.dart'
    as _i307;
import '../../features/user_profile/domain/use_cases/cancel_friend_request_usecase.dart'
    as _i885;
import '../../features/user_profile/domain/use_cases/send_friend_requset_usecase.dart'
    as _i9;
import '../../features/user_profile/domain/use_cases/user_profile_use_case.dart'
    as _i537;
import '../../features/user_profile/presentation/bloc/user_profile_bloc.dart'
    as _i989;
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
    gh.factory<_i726.ChattedUsersRemoteDs>(
      () => _i315.ChattedUsersRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i820.UserProfileRemoteDs>(
      () => _i190.UserProfileRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i458.ChatRemoteDs>(
      () => _i454.ChatRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i47.SearchRemoteDs>(
      () => _i568.SearchRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i307.UserProfileRepo>(
      () => _i940.UserProfileRepoImpl(gh<_i820.UserProfileRemoteDs>()),
    );
    gh.factory<_i843.AuthRemoteDs>(
      () => _i541.AuthRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i68.FriendsRemoteDs>(
      () => _i740.FriendsRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i753.FriendRequestRemoteDs>(
      () => _i1028.FriendRequestRemoteDsImpl(gh<_i576.APIManager>()),
    );
    gh.factory<_i537.UserProfileUseCase>(
      () => _i537.UserProfileUseCase(gh<_i307.UserProfileRepo>()),
    );
    gh.factory<_i9.SendFriendRequestUseCase>(
      () => _i9.SendFriendRequestUseCase(gh<_i307.UserProfileRepo>()),
    );
    gh.factory<_i885.CancelFriendRequestUseCase>(
      () => _i885.CancelFriendRequestUseCase(gh<_i307.UserProfileRepo>()),
    );
    gh.factory<_i989.UserProfileBloc>(
      () => _i989.UserProfileBloc(
        gh<_i537.UserProfileUseCase>(),
        gh<_i9.SendFriendRequestUseCase>(),
        gh<_i885.CancelFriendRequestUseCase>(),
      ),
    );
    gh.factory<_i943.FriendRequestsRepo>(
      () => _i472.FriendRequestsRepoImpl(gh<_i753.FriendRequestRemoteDs>()),
    );
    gh.factory<_i45.ChattedUsersRepo>(
      () => _i358.ChattedUsersRepoImpl(gh<_i726.ChattedUsersRemoteDs>()),
    );
    gh.factory<_i359.ChatRepo>(
      () => _i67.ChatRepoImpl(gh<_i458.ChatRemoteDs>()),
    );
    gh.factory<_i230.FriendRequestUseCase>(
      () => _i230.FriendRequestUseCase(gh<_i943.FriendRequestsRepo>()),
    );
    gh.factory<_i976.AuthRepo>(
      () => _i751.AuthRepoImpl(gh<_i843.AuthRemoteDs>()),
    );
    gh.factory<_i858.SearchRepo>(
      () => _i175.SearchRepoImpl(gh<_i47.SearchRemoteDs>()),
    );
    gh.factory<_i661.FriendsRepo>(
      () => _i320.FriendsRepoImpl(gh<_i68.FriendsRemoteDs>()),
    );
    gh.factory<_i847.FriendRequestsBloc>(
      () => _i847.FriendRequestsBloc(gh<_i230.FriendRequestUseCase>()),
    );
    gh.factory<_i1039.ChatUseCase>(
      () => _i1039.ChatUseCase(gh<_i359.ChatRepo>()),
    );
    gh.factory<_i703.SendMessageUseCase>(
      () => _i703.SendMessageUseCase(gh<_i359.ChatRepo>()),
    );
    gh.factory<_i1068.ChattedUsersUseCase>(
      () => _i1068.ChattedUsersUseCase(gh<_i45.ChattedUsersRepo>()),
    );
    gh.factory<_i119.GetFriendsUseCase>(
      () => _i119.GetFriendsUseCase(gh<_i661.FriendsRepo>()),
    );
    gh.factory<_i806.ChattedUsersBloc>(
      () => _i806.ChattedUsersBloc(gh<_i1068.ChattedUsersUseCase>()),
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
    gh.factory<_i601.SearchUseCase>(
      () => _i601.SearchUseCase(gh<_i858.SearchRepo>()),
    );
    gh.factory<_i1012.LoginUseCase>(
      () => _i1012.LoginUseCase(gh<_i976.AuthRepo>()),
    );
    gh.factory<_i957.RegisterUseCase>(
      () => _i957.RegisterUseCase(gh<_i976.AuthRepo>()),
    );
    gh.factory<_i211.SearchBloc>(
      () => _i211.SearchBloc(gh<_i601.SearchUseCase>()),
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
