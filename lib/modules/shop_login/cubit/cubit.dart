
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/models/login_model.dart';
import 'package:untitled11/modules/shop_login/cubit/states.dart';
import 'package:untitled11/shared/network/end_point.dart';
import 'package:untitled11/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialStates());
  static LoginCubit get(context) =>BlocProvider.of(context);
  LoginModel? loginModel;
  bool isPassword=true;
  void changeShownVisibility()
  {
    isPassword=!isPassword;
    emit(LoginChangeShownVisibilityStates());
  }

   void userLogin({
    required String email,
     required String password,
})
   {
     emit(LoginLoadingStates());
     DioHelper.postData(url: LOGIN,
         data: {
           'email':email,
           'password':password,
         }
     ).then((value) {
       // print(value.data);
      loginModel=LoginModel.fromjson(value.data);
     print(loginModel!.status);
     print(loginModel!.message);
      // print(loginModel!.data!.token);
      // print(loginModel);
       emit(LoginSuccessStates(loginModel!));
     }).catchError((error){
       emit(LoginErrorStates(error.toString()));
       print(error.toString());


     });
   }

}