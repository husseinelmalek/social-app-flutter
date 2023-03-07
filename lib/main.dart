import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/layout/news_app/news_layout.dart';
import 'package:untitled/layout/shop_app/cubit/shop_cubit.dart';
import 'package:untitled/layout/shop_app/shop_layout.dart';
import 'package:untitled/layout/social_app/cubit/cubit.dart';
import 'package:untitled/layout/social_app/social_layout.dart';
import 'package:untitled/layout/todo_app/todo_home_layout.dart';
import  'package:untitled/layout/todo_app/todo_home_layout.dart';

import 'package:untitled/modules/counter/counter.dart';
import 'package:untitled/modules/shop_app/on_boarding/on_boardingScreen.dart';
import 'package:untitled/modules/shop_app/shop_login_screen/shop_login_screen.dart';
import 'package:untitled/modules/social_app/social_login/social_login_screen.dart';

import 'package:untitled/shared/bloc_observer.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/styles/themes.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();


  Widget widget;
  bool? isDark= CacheHelper.getData(key: 'isDark');

  // bool? onBoarding= CacheHelper.getData(key: 'onBoarding');
  uId=CacheHelper.getData(key: 'uId');
  print(uId);
  // token= CacheHelper.getData(key: 'token');
  // if(onBoarding !=null)
  //   {
  //     if(token != null){
  //       widget= ShopLayout();
  //     }else
  //       {
  //         widget = ShopLoginScreen();
  //       }
  //   }else{
  //   widget=OnBoardingScreen();
  // }
if(uId != null){
  widget = SocialLayout();
}else
  {
    widget=SocialLoginScreen();
  }
  runApp(MyApp(
 isDark: isDark,
 startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

  final bool? isDark;
  final Widget startWidget ;
  MyApp({required this.isDark, required this.startWidget});


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience()) ,
        BlocProvider(create: (context) => AppCubit()..changeMode(fromShared: isDark,)),
        BlocProvider(create: (context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..getSettingData()),
        BlocProvider(create: (context) => SocialCubit()..getUserData()),

      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context, state) {

        },
        builder:(context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme:darkTheme ,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
