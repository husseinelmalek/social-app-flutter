import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/modules/shop_app/shop_login_screen/cubit/states.dart';
import 'package:untitled/shared/network/end_points.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit():super(ShopLoginInitialState());
  static ShopLoginCubit get(context) =>BlocProvider.of(context);


late ShopLoginModel loginModel;
  void userLogin({
    required String email,
    required String password
  }){
    emit(ShopLoginLoadingState());
    DioHelper.postData(

      url: LOGIN,
      data:{
        'email':email,
        'password':password,
        },
    ).then((value) {
      print(value.data);
      loginModel=ShopLoginModel.fromJson(value.data);
      //print(loginModel.status);
      print(loginModel.message);
      print(loginModel.data?.token);

      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      //emit(ShopLoginErrorState(error.toString()));
      emit(ShopLoginErrorState(error.toString()));
    });
  }

bool isShow = true;
  void changePasswordIcon(){
    isShow =! isShow;
    emit(ShopChangePasswordIconState());
  }

}