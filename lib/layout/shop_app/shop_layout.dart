import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
import 'package:untitled11/layout/shop_app/cubit/states.dart';
import 'package:untitled11/modules/search/search_screen.dart';
import 'package:untitled11/modules/shop_login/shop_login_screen.dart';
import 'package:untitled11/shared/components/components.dart';
import 'package:untitled11/shared/network/local/cashe_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
     listener: (context,state){},
      builder: (context,state){
       var cubit=ShopCubit.get(context);
       return Scaffold(
         appBar: AppBar(
           title: Text('Salla',
             style: TextStyle(fontSize: 25.0),),
           actions: [
             IconButton(onPressed: (){
               NavigateTo(context, SearchScreen());
             }, icon: Icon(Icons.search),),
           ],
         ),
         body: cubit.screen[cubit.currentIndex],
         bottomNavigationBar: BottomNavigationBar(
           currentIndex: cubit.currentIndex,
           onTap: (index)
           {
             cubit.changeBottomNav(index);
           },
           items: cubit.bottomNav,
         ),
       );
      },
    );
  }
}
