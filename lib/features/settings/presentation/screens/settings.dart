import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/di/di.dart';
import 'package:chat_box/features/settings/bloc/logout_bloc/logout_bloc.dart';
import 'package:chat_box/features/starting/presentation/screens/starting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutBloc,LogoutState>(
      listener: (context,state) {
         if(state is LogoutSuccess){
           print('🚪🚪🚪🚪 Logged out');
           CacheHelper.clearToken();
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartingScreen()));
         } else{
           print("🏮🏮🏮🏮 somethign went wrong");
         }
      },
      child: Center(
        child: InkWell(
            onTap: (){
              context.read<LogoutBloc>().add(LoggingOutEvent());

            },
            child: Text('Logout')
        ),
      ),
    );
  }
}
