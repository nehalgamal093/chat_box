import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/di/di.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
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
           CacheHelper.clearToken();
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartingScreen()));
         } else if(state is LogoutLoading){
           showLoading(context);
         }
      },
      child: ListView(
        children: [
          ListTile(
            trailing: Icon(Icons.logout,color: ColorsManager.grey,),
            title: Text(StringsManager.logout,style: TextStyle(color: ColorsManager.grey),),
            onTap: (){
             context.read<LogoutBloc>().add(LoggingOutEvent());
            },
          )

        ],
      ),
    );
  }
}
Future<void> showLoading(BuildContext context){
 return showDialog(context: context, builder: (context){
   return Center(child: CircularProgressIndicator(color: ColorsManager.cyan,));
 });
}