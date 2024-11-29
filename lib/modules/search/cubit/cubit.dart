
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/models/search_model.dart';
import 'package:untitled11/modules/search/cubit/states.dart';
import 'package:untitled11/shared/components/constants.dart';
import 'package:untitled11/shared/network/end_point.dart';
import 'package:untitled11/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitialStates());
  static SearchCubit get(context)=>BlocProvider.of(context);

  SearchModel? searchModel;

  void searchData(String text)
  {
    emit(SearchLoadingStates());
    DioHelper.postData(

        url: SEARCH,
        data: {
          'text':text,
        },
      token: token,
      lang:'en',


    ).then((value) {
      searchModel=SearchModel.fromJson(value.data);
      print(searchModel.toString());
      emit(SearchSuccessStates(searchModel!));
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorStates());
    });
  }

}