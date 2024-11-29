
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/models/login_model.dart';
import 'package:untitled11/modules/shop_login/cubit/states.dart';
import 'package:untitled11/modules/shop_register/cubit/states.dart';
import 'package:untitled11/shared/network/end_point.dart';
import 'package:untitled11/shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialStates());
  static RegisterCubit get(context) =>BlocProvider.of(context);
  LoginModel? loginModel;
  bool isPassword=true;
  void changeShownVisibility()
  {
    isPassword=!isPassword;
    emit(RegisterChangeShownVisibilityStates());
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    emit(RegisterLoadingStates());
    DioHelper.postData(url: REGISTER,
        data: {
          'name':name,
          'email':email,
          'password':password,
          'phone':phone,

        }
    ).then((value) {
      // print(value.data);
      loginModel=LoginModel.fromjson(value.data);
      print(loginModel!.status);
      print(loginModel!.message);
      // print(loginModel!.data!.token);
      // print(loginModel);
      emit(RegisterSuccessStates(loginModel!));
    }).catchError((error){
      emit(RegisterErrorStates(error.toString()));
      print(error.toString());
      print('omar');


    });
  }

}