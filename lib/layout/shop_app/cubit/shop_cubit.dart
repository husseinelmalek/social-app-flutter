


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/shop_states.dart';
import 'package:untitled/models/shop_app/categories_model.dart';
import 'package:untitled/models/shop_app/favorites_data_model.dart';
import 'package:untitled/models/shop_app/favorites_model.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/models/shop_app/register_model.dart';
import 'package:untitled/models/shop_app/setting_model.dart';
import 'package:untitled/modules/shop_app/categories/categories_screen.dart';
import 'package:untitled/modules/shop_app/favourites/favourites_screen.dart';
import 'package:untitled/modules/shop_app/products/products_screen.dart';
import 'package:untitled/modules/shop_app/settings/setting_screen.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../../shared/network/end_points.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit():super(ShopInitialState());
static ShopCubit get(context)=>BlocProvider.of(context);


int currentIndex=0;

List<Widget> bottomScreens=[
  ProductsScreen(),
  CategoriesScreen(),
  FavouritesScreen(),
  SettingsScreen(),
];

void changeBottomNav(int index){
  currentIndex =index;
  emit(ShopChangeBottomNavState());
}
 HomeModel? homeModel;

late Map<int , bool> favorites = {};
void getHomeData()
{
  emit(ShopLoadingHomeDataState());
  DioHelper.getData(
      url: HOME,
    token: token,
  ).then((value){
    homeModel=HomeModel.fromJson(value.data);
    //printFullText(homeModel.toString());
    //print(homeModel?.data.banners[0].image);
    //print(homeModel?.status);

    homeModel?.data.products.forEach((element) {
      favorites.addAll({
        element.id : element.inFavorites,
      });
    });
    print(favorites.toString());
    emit(ShopSuccessHomeDataState());

  }).catchError((onError){
    print(onError.toString());
    emit(ShopErrorHomeDataState());
  });
}

  CategoriesModel? categoriesModel;
  void getCategoriesData()
  {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value){
      categoriesModel=CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesState());

    }).catchError((onError){
      print(onError.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  FavoritesModel? favoriteModel;
  void changeFavorites (int productId){
    favorites[productId]= !favorites[productId]!;
    emit(ShopChangeFavoritesState());
    DioHelper.postData(
        url:FAVORITES,
        data:{
          'product_id':productId,
        },
        token: token,
    ).then((value) {

      favoriteModel=FavoritesModel.fromJson(value.data);
      if(favoriteModel!.status == false){
        favorites[productId]= !favorites[productId]!;

      }
      else {
        getFavoritesData();
        emit(ShopSuccessFavoritesState(favoriteModel!));
      }
            }
    ).catchError((onError){
      favorites[productId]= !favorites[productId]!;
      emit(ShopErrorFavoritesState());
    });
  }


  FavDataModel? favDataModel;
  void getFavoritesData(){
    emit(ShopLoadingGetFavState());
    DioHelper.getData(
        url:FAVORITES,
      token: token
    ).then((value) {
      favDataModel=FavDataModel.fromJson(value.data);
      //printFullText(value.data.toString());
      emit(ShopSuccessGetFavDataState());

    }).catchError((onError){
      print(onError.toString());
      emit(ShopErrorGetFavDataState());

    });

  }

  ShopSettingModel? salah;
  void getSettingData(){
    emit(ShopLoadingGetSettingState());
    DioHelper.getData(
        url:PROFILE,
        token: token
    ).then((value) {
      salah=ShopSettingModel.fromJson(value.data);
      print(value.data);
      printFullText(salah!.data.name);
      emit(ShopSuccessGetSettingState());

    }).catchError((onError){
      print(onError.toString());
      emit(ShopErrorGetSettingState());

    });

  }



  void getUpdateData(
  {
required String name,
required String email,
required String phone,
})
  {
    emit(ShopLoadingGetUpdateUserState());
    DioHelper.putData(
        url:UPDATE_PROFILE,
        token: token,
      data:{
          'name' : name,
        'email':email,
        'phone':phone,
      }

    ).then((value) {
      salah=ShopSettingModel.fromJson(value.data);
      print(value.data);
      printFullText(salah!.data.name);
      emit(ShopSuccessGetUpdateUserState(salah!));

    }).catchError((onError){
      print(onError.toString());
      emit(ShopErrorGetUpdateUserState());

    });

  }
}