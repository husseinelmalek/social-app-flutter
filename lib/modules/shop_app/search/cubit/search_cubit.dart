
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/shop_app/search_model.dart';
import 'package:untitled/modules/shop_app/search/cubit/search_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/end_points.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit():super(InitialSearchState());
  static SearchCubit get(context) =>BlocProvider.of(context);

  late SearchModel searchModel;
  void getSearch(String text){
    emit(LoadingSearchState());
    DioHelper.postData(
        url: SEARCH,
        token: token,
        data: {
      'text':text,
        }).then((value) {
          searchModel=SearchModel.fromJson(value.data);
          emit(SuccessSearchState());
    }).catchError((onError){
      print(onError.toString());
      emit(ErrorSearchState());
    }
    );
  }

}