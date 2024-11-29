
class FavoritesModel
{
  bool?status;
  Data? data;
  FavoritesModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    data = Data.fromJson(json['data']);
  }

}
class Data
{
  int? currentPage;
  List<FavoritesData> data=[];
  String? firstPageUrl;
  Data.fromJson(Map<String,dynamic>json)
  {
    currentPage=json['currentPage'];

    json['data'].forEach((element){
      data.add(FavoritesData.fromJson(element));
    });

  }
}

class FavoritesData
{
  int? id;
  Product? product;
  FavoritesData.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    product= Product.fromJson(json['product']);
  }

}

class Product
{
  int?id;
  dynamic price;
  dynamic old_price;
  int? discount;
  String? name;
  String?image;
  String? description;

  Product.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    price=json['price'];
    old_price=json['old_price'];
    discount=json['discount'];
    name=json['name'];
    image=json['image'];
    description=json['description'];

  }

}