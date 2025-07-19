import 'package:chat_box/features/chat/presentation/provider/file_picker_provider.dart';
import 'package:chat_box/features/chat/presentation/provider/show_scroll_button.dart';
import 'package:flutter/material.dart';
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
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => FilePickerProvider()),
        ChangeNotifierProvider(create: (context) => ShowScrollButton()),
      ],
      child: const MyApp(),
    ),
  );
}
