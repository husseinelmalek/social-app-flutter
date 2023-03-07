import 'package:untitled/models/shop_app/favorites_data_model.dart';

class SearchModel {
  late Data data;
  SearchModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    //(json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }

}

class Data {

  List<ProductS> data=[];

  Data.fromJson(Map<String, dynamic> json) {

      json['data'].forEach((v) {
        data.add( ProductS.fromJson(v));
      });


  }

}

class ProductS {
  late dynamic price;
  int? id;
  late dynamic oldPrice;
  int?  discount;
  late String image;
  late String name;
  late String description;

  ProductS.fromJson(Map<String, dynamic> json) {
    price = json['price'];
   id=json['id'];
   oldPrice=json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}