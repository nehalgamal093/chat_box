import 'package:flutter/material.dart';

import '../../../../core/resources/colors/colors_manager.dart';

class LoadingTopBar extends StatelessWidget {
  const LoadingTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ListView.separated(
      scrollDirection: Axis.horizontal,
        separatorBuilder: (context,index)=>SizedBox(width: 10,),
        itemCount: 3,
        itemBuilder: (context,index){
          return Container(
            height: size.height * .15,
            width: size.width * .3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ColorsManager.secondaryClr),
            ),
          );
        });
  }
}
