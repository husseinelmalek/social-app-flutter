class SocialUserModel {
  String? name ;
  late String email;
  late String phone;
  String? uId;
  String? image;
  String? bio;
  String? cover;
  bool? isEmailVerified;
  SocialUserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.image,
    required this.bio,
    required this.cover,
    required this.isEmailVerified,

  });
  SocialUserModel.fromMap(Map<String , dynamic> json){
    name:json['name'];
    email:json['email'];
    phone:json['phone'];
    uId:json['uId'];
    image:json['image'];
    bio:json['bio'];
    cover:json['cover'];
    isEmailVerified:json['isEmailVerified'];
  }

Map<String,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'image':image,
      'bio':bio,
      'cover':cover,
      'isEmailVerified':isEmailVerified,
    };

}

}