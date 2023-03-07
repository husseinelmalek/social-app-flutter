import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/models/shop_app/register_model.dart';

abstract class ShopRegisterStates {}
class ShopRegisterInitialState extends ShopRegisterStates {}

class ShopRegisterLoadingState extends ShopRegisterStates {}
class ShopRegisterSuccessState extends ShopRegisterStates {
  final ShopRegisterModel registerModel;

  ShopRegisterSuccessState(this.registerModel);
}
class ShopRegisterErrorState extends ShopRegisterStates {
  final String error;

  ShopRegisterErrorState(this.error);
}
class ShopRegisterChangePasswordIconState extends ShopRegisterStates {}