
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/layout/shop_app/cubit/states.dart';
import 'package:untitled11/models/categories_model.dart';
import 'package:untitled11/models/change_favorites_model.dart';
import 'package:untitled11/models/favorites_model.dart';
import 'package:untitled11/models/home_model.dart';
import 'package:untitled11/models/login_model.dart';
import 'package:untitled11/modules/categories/cateogries_screen.dart';
import 'package:untitled11/modules/favorites/favorites_screen.dart';
import 'package:untitled11/modules/products/products_screen.dart';
import 'package:untitled11/modules/setting/setting_screen.dart';
import 'package:untitled11/shared/components/constants.dart';
import 'package:untitled11/shared/network/end_point.dart';
import 'package:untitled11/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() :super(ShopInitialStates());
  static ShopCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  List<Widget> screen=[
     ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

  List<BottomNavigationBarItem> bottomNav=[
    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Category'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
  ];

  void changeBottomNav(int index)
  {
    currentIndex=index;
    emit(ChangeShopBottomNav());
  }

HomeModel? homeModel;
  Map<int, bool> favorites={};

  void getHomeData()
  {
    emit(ShopLoadingHomeStates());
    DioHelper.getData(
      url: HOME,

      token: token,

    ).then((value) {
      homeModel=HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element)
      {
        favorites.addAll({
          element.id! : element.in_favorites!,
        });
      });
      print(homeModel!.status);
      print('Success Home');
      // print(favorites.toString());
      emit(ShopSuccessHomeStates());

    }).catchError((error){
      emit(ShopErrorHomeStates());
      print(error.toString());

    });
  }


  CategoriesModel? categoriesModel;

  void getCategoriesData()
  {

    DioHelper.getData(
      url: CATEGORIES,

      token: token,

    ).then((value) {
      categoriesModel=CategoriesModel.fromJson(value.data);
      print(categoriesModel!.status);
      // print(homeModel!.data!.banners[0].image);
      print('Success Categories');
      emit(ShopSuccessCategoriesStates());

    }).catchError((error){
      emit(ShopErrorCategoriesStates());
      print(error.toString());

    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId)
  {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesStates());
    DioHelper.postData(
        url: FAVORITES,
        data:
        {
          'product_id':productId,
        },
      token: token,
    ).then((value) {
      changeFavoritesModel=ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if(!changeFavoritesModel!.status!)
        {
          favorites[productId] = !favorites[productId]!;
        }else
          {
            getFavoritesData();
          }
      emit(ShopSuccessChangeFavoritesStates(changeFavoritesModel!));

    }).catchError((error){
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorChangeFavoritesStates());

    });
  }

FavoritesModel? favoritesModel;
  void getFavoritesData()
  {
    emit(ShopLoadingGetFavoritesStates());

    DioHelper.getData(
      url: FAVORITES,

      token: token,

    ).then((value) {
      favoritesModel=FavoritesModel.fromJson(value.data);
      print(favoritesModel!.status);
      // printFullText(value.data.toString());

      print('Success Favorites');
      emit(ShopSuccessGetFavoritesStates());

    }).catchError((error){
      emit(ShopErrorGetFavoritesStates());
      print(error.toString());

    });
  }


  LoginModel? userModel;
  void getUserData()
  {
    emit(ShopLoadingUserDataStates());

    DioHelper.getData(
      url: PROFILE,

      token: token,

    ).then((value) {
      userModel=LoginModel.fromjson(value.data);
      print(userModel!.status);


      print('Success UserLogin');
      emit(ShopSuccessUserDataStates(userModel!));

    }).catchError((error){
      emit(ShopErrorUserDataStates());
      print(error.toString());

    });
  }


  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();

  LoginModel? updateModel;
  void updateUser({
    required String name,
    required String email,
    required String phone,

})
  {

    emit(ShopLoadingUpdateUserStates(userModel!));
    DioHelper.putData(
      url: UPDATE_PROFILE,
      data:
      {
        'name':name,
        'email':email,
        'phone':phone,
      },
      token: token,
    ).then((value) {
      updateModel=LoginModel.fromjson(value.data);
      print(value.data);

      emit(ShopSuccessUpdateUserStates(userModel!));
      // nameController.text=name;
      // emailController.text=email;
      // phoneController.text=phone;
      getUserData();


    }).catchError((error){

      emit(ShopErrorUpdateUserStates());
      print(error.toString());

    });
  }


}