import 'package:chat_box/features/chat/presentation/bloc/socket_bloc.dart';
import 'package:chat_box/features/chat/presentation/provider/chat_shell_provider.dart';
import 'package:chat_box/features/chat/presentation/provider/file_picker_provider.dart';
import 'package:chat_box/features/chat/presentation/provider/show_scroll_button.dart';
import 'package:chat_box/features/chat/presentation/provider/update_my_data.dart';
import 'package:chat_box/features/user_profile/presentation/provider/video_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'core/caching/cache_helper.dart';
import 'core/di/di.dart';
import 'features/app/presentation/app.dart';
import 'features/main/presentation/provider/bottom_nav_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await CacheHelper.init();
  await dotenv.load(fileName: ".env");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>getIt<SocketBloc>())
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomNavProvider()),
          ChangeNotifierProvider(create: (context) => FilePickerProvider()),
          ChangeNotifierProvider(create: (context) => ShowScrollButton()),
          ChangeNotifierProvider(create: (context) => UpdateMyData()),
          ChangeNotifierProvider(create: (context) => VideoControllers()),
          ChangeNotifierProvider(create: (context) => ChatShellProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
