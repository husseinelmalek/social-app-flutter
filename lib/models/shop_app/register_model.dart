import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/modules/shop_app/shop_register_screen/cubit/cubit.dart';

class ShopRegisterModel {
  late bool status;
  late String message;
  UserRegister? data;
  ShopRegisterModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=UserRegister.fromJson(json['data']);
   }

}
class UserRegister{
  late String name;
  late String email;
  late String phone;
  late String image;
late String token;
//   UserData({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.image,
//     required this.points,
//     required this.credit,
//     required this.token,
//
// });
  UserRegister.fromJson(Map<String,dynamic> json)
  {
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    token=json['token'];
  }

}