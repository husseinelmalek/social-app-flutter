import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/social_app/cubit/states.dart';
import 'package:untitled/models/social_app/social_user_model.dart';
import 'package:untitled/modules/social_app/chats/chats_screen.dart';
import 'package:untitled/modules/social_app/feeds/feeds_screen.dart';
import 'package:untitled/modules/social_app/post/post_screen.dart';
import 'package:untitled/modules/social_app/settings/settings_screen.dart';
import 'package:untitled/modules/social_app/users/users_screen.dart';
import 'package:untitled/shared/components/constants.dart';

class SocialCubit extends Cubit<SocialStates>{
  SocialCubit():super(SocialInitialState());
static SocialCubit get(context) => BlocProvider.of(context);

   SocialUserModel? socialUserModel;
void getUserData(){
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
          socialUserModel = SocialUserModel.fromMap(value.data()!);
           print(socialUserModel?.name);
          emit(SocialGetUserSuccessState());
    }).catchError((onError){
      print('this is the errrorrororororo ${onError.toString()}');
      emit(SocialGetUserErrorState(onError.toString()));
    });

  }

int currentIndex=0;
List<String> titles=[
  'Feeds',
  'chats',
  'posts',
  'users',
  'setting',
];
List<Widget> screens =[
  FeedsScreen(),
  ChatsScreen(),
  PostScreen(),
  UserScreen(),
  SettingScreen(),

];
void changeSocialBottomNav(int index){

  if(index==2){
    emit(SocialAddPostState());
  }else {
    currentIndex=index;
  emit(SocialChangeBottomNavState());
}
}


}