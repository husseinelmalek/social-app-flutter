import 'package:untitled/models/shop_app/favorites_model.dart';
import 'package:untitled/models/shop_app/register_model.dart';
import 'package:untitled/models/shop_app/setting_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates{}
class ShopChangeBottomNavState extends ShopStates{}
class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{}

class ShopSuccessCategoriesState extends ShopStates{}
class ShopErrorCategoriesState extends ShopStates{}

class ShopChangeFavoritesState extends ShopStates{}
class ShopSuccessFavoritesState extends ShopStates{
  late FavoritesModel model;

  ShopSuccessFavoritesState(this.model);
}
class ShopErrorFavoritesState extends ShopStates{}
class ShopLoadingGetFavState extends ShopStates{}
class ShopSuccessGetFavDataState extends ShopStates{}
class ShopErrorGetFavDataState extends ShopStates{}

class ShopLoadingGetSettingState extends ShopStates{}
class ShopSuccessGetSettingState extends ShopStates{}
class ShopErrorGetSettingState extends ShopStates{}



class ShopLoadingGetUpdateUserState extends ShopStates{}
class ShopSuccessGetUpdateUserState extends ShopStates{
  late ShopSettingModel model;

  ShopSuccessGetUpdateUserState(this.model);
}
class ShopErrorGetUpdateUserState extends ShopStates{}