import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/models/shop_app/register_model.dart';
import 'package:untitled/modules/shop_app/shop_login_screen/cubit/states.dart';
import 'package:untitled/modules/shop_app/shop_register_screen/cubit/states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/end_points.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>{
  ShopRegisterCubit():super(ShopRegisterInitialState());
  static ShopRegisterCubit get(context) =>BlocProvider.of(context);

  late ShopRegisterModel registerModel;


  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone
  }){
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url:REGISTER,
      data:{
        'name':name,
        'email':email,
        'password':password,
        'phone':phone
        },
    ).then((value) {
      //print(value.data);
      //print('hussein elmalek');
        registerModel = ShopRegisterModel.fromJson(value.data);

      //print(loginModel.status);
      //print('mohamed ali');
      //print(registerModel.message);
      //print(registerModel.data?.token);

      emit(ShopRegisterSuccessState(registerModel));
    }).catchError((error){
      print(error.toString());
      //emit(ShopLoginErrorState(error.toString()));
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

bool isShow = true;
  void changePasswordIcon(){
    isShow =! isShow;
    emit(ShopRegisterChangePasswordIconState());
  }

}