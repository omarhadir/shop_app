class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<BannerModel> banners = [];
  List<ProductModel> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element){
      banners.add(BannerModel.fromJson(element));
    });

    json['products'].forEach((element)
    {
      products.add(ProductModel.fromJson(element));
    });
    // for (var banner in json['banners']) {
    //   banners.add(BannerModel.fromJson(banner));
    // }
    //
    // for (var product in json['products']) {
    //   products.add(ProductModel.fromJson(product));
    }
  }


class BannerModel {
  int? id;
  String? image;

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String? image;
  String? name;
  bool? in_favorites;
  bool? in_cart;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}


//
// class HomeModel
// {
//   bool? status;
//   HomeDataModel?data;
//
//   HomeModel.fromJson(Map<String,dynamic>json)
//   {
//     status=json['states'];
//     data=HomeDataModel.fromJson(json['data']);
//   }
//
// }
//
// class HomeDataModel
// {
//   List<BannersModel>banners=[];
//   List<ProductsModel>products=[];
//   HomeDataModel.fromJson(Map<String,dynamic>json)
//   {
//     json['banners'].forEach((element)
//     {
//       banners.add(BannersModel.fromJson(element));
//     }
//
//     );
//     json['banners'].forEach((element)
//     {
//       banners.add(BannersModel.fromJson(element));
//     }
//
//     );
//   }
// }
//
// class BannersModel
// {
//   int? id;
//   String? image;
//   BannersModel.fromJson(Map<String,dynamic>json)
//   {
//     id=json['id'];
//     image=json['image'];
//   }
// }
//
//
// class ProductsModel
// {
//   int? id;
//   dynamic price;
//   dynamic old_price;
//   dynamic discount;
//   String? image;
//   String? name;
//   bool? in_favorites;
//   bool? in_cart;
//
//
//   ProductsModel.fromJson(Map<String,dynamic>json)
//   {
//     id=json['id'];
//     price=json['price'];
//     old_price=json['old_price'];
//     discount=json['discount'];
//     image=json['image'];
//     name=json['name'];
//     in_favorites=json['in_favorites'];
//     in_cart=json['in_cart'];
//   }
// }