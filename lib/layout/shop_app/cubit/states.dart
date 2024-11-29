
import 'package:untitled11/models/change_favorites_model.dart';
import 'package:untitled11/models/favorites_model.dart';
import 'package:untitled11/models/login_model.dart';

abstract class ShopStates{}
class ShopInitialStates extends ShopStates{}
class ChangeShopBottomNav extends ShopStates{}

class ShopLoadingHomeStates extends ShopStates{}
class ShopSuccessHomeStates extends ShopStates{}
class ShopErrorHomeStates extends ShopStates{}

class ShopSuccessCategoriesStates extends ShopStates{}
class ShopErrorCategoriesStates extends ShopStates{}


class ShopSuccessChangeFavoritesStates extends ShopStates{

  final ChangeFavoritesModel model;

  ShopSuccessChangeFavoritesStates(this.model);
}
class ShopChangeFavoritesStates extends ShopStates{}
class ShopErrorChangeFavoritesStates extends ShopStates{}

class ShopLoadingGetFavoritesStates extends ShopStates{}
class ShopSuccessGetFavoritesStates extends ShopStates{}
class ShopErrorGetFavoritesStates extends ShopStates{}



class ShopLoadingUserDataStates extends ShopStates{}
class ShopSuccessUserDataStates extends ShopStates{

  final LoginModel model;

  ShopSuccessUserDataStates(this.model);


}
class ShopErrorUserDataStates extends ShopStates{}


class ShopLoadingUpdateUserStates extends ShopStates{
  final LoginModel model;

  ShopLoadingUpdateUserStates(this.model);
}
class ShopSuccessUpdateUserStates extends ShopStates{

  final LoginModel model;

  ShopSuccessUpdateUserStates(this.model);


}
class ShopErrorUpdateUserStates extends ShopStates{}

