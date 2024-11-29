import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
import 'package:untitled11/layout/shop_app/shop_layout.dart';
import 'package:untitled11/modules/on_boarding/on_boarding_screen.dart';
import 'package:untitled11/modules/shop_login/shop_login_screen.dart';
import 'package:untitled11/shared/components/constants.dart';
import 'package:untitled11/shared/network/local/cashe_helper.dart';
import 'package:untitled11/shared/network/remote/dio_helper.dart';
import 'package:untitled11/shared/styles/bolc_observer.dart';
import 'package:untitled11/shared/styles/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
 await CacheHelper.init();
  Widget widget;
 bool? onBoarding=CacheHelper.getData(key: 'onBoarding');
   token=CacheHelper.getData(key: 'token');


  if(onBoarding !=null)
  {
    if(token!=null) widget=ShopLayout();
    else widget= ShopLoginScreen();
  }else
    {
      widget=OnBoardingScreen();
    }


  runApp( MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  MyApp({this.startWidget});
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ShopCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..getUserData(),
      child: MaterialApp(
        // title: 'Flutter Demo',
        theme: lightThem,
        // darkTheme: darkThem,
        debugShowCheckedModeBanner: false,
        home:startWidget,
      ),
    );
  }
}
