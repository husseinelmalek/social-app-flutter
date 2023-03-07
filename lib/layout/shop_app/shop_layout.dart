
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/shop_cubit.dart';
import 'package:untitled/layout/shop_app/cubit/shop_states.dart';
import 'package:untitled/modules/shop_app/search/search_screen.dart';
import 'package:untitled/modules/shop_app/shop_login_screen/shop_login_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('sallla'),
            actions: [
              IconButton(onPressed: () {
                navigateTo(context, SearchScreen());
              }, icon: Icon(Icons.search),)
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [

              BottomNavigationBarItem(
                label: 'products',
                icon: Icon( Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Categories',
                icon: Icon( Icons.apps),
              ),
              BottomNavigationBarItem(
                label: 'Favourites',
                icon: Icon( Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'settings',
                icon: Icon( Icons.settings),
              ),

            ],
            onTap: (value) => cubit.changeBottomNav(value),
currentIndex: cubit.currentIndex,
          ),

        );

      },
    );
  }
}
