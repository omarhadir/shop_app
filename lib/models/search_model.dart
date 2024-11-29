
class SearchModel
{
  bool?status;
  Data? data;
  SearchModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    data = Data.fromJson(json['data']);
  }

}
class Data
{
  int? currentPage;
  List<Product> data=[];
  String? firstPageUrl;
  Data.fromJson(Map<String,dynamic>json)
  {
    currentPage=json['currentPage'];

    json['data'].forEach((element){
      data.add(Product.fromJson(element));
    });

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