// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
// import 'package:untitled11/layout/shop_app/cubit/states.dart';
// import 'package:untitled11/models/home_model.dart';
// import 'package:untitled11/shared/components/components.dart';
//
// import '../../shared/network/local/cashe_helper.dart';
// import '../shop_login/shop_login_screen.dart';
//
// class ProductsScreen extends StatelessWidget {
//   const ProductsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopCubit,ShopStates>(
//      listener: (context,state){},
//       builder: (context,state){
//        var cubit=ShopCubit.get(context);
//        return ConditionalBuilder(condition: cubit.homeModel != null,
//            builder:(context)=> productsBuilder(cubit.homeModel!),
//            fallback: (context)=>Center(child: CircularProgressIndicator()));
//       },
//     );
//   }
//   Widget productsBuilder(HomeModel model)=> SingleChildScrollView(
//     child: Column(
//       children: [
//         CarouselSlider(
//           items:model.data!.banners.map((e) =>
//               Image(image: NetworkImage('${e.image}'),
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//           ).toList(),
//
//            options: CarouselOptions(
//              height: 250.0,
//              initialPage: 0,
//              viewportFraction: 1.0,
//              enableInfiniteScroll: false,
//              reverse: false,
//              autoPlay: true,
//            autoPlayInterval: Duration(seconds: 5),
//              autoPlayAnimationDuration: Duration(seconds: 1),
//              autoPlayCurve: Curves.fastOutSlowIn,
//              scrollDirection: Axis.horizontal,
//
//
//            ),),
//         SizedBox(height: 10.0,),
//
//         Container(
//           color: Colors.grey[400],
//           child: GridView.count(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             crossAxisCount: 2,
//             mainAxisSpacing: 3.0,
//             crossAxisSpacing:3.0 ,
//             childAspectRatio: 1/1.58,
//             children: List.generate(model.data!.products.length,
//                     (index) =>buildGridProducts(model.data!.products[index]),
//
//             ),
//
//           ),
//         ),
//
//       ],
//     ),
//   );
//   Widget buildGridProducts(ProductModel model)=> Container(
//     color: Colors.white,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//
//         Stack(
//           alignment: AlignmentDirectional.bottomStart,
//           children: [
//             Image(
//                 image: NetworkImage('${model.image}'),
//               width: double.infinity,
//               height:200.0 ,
//
//             ),
//             if(model.discount !=0)
//             Container(
//               padding: EdgeInsetsDirectional.symmetric(horizontal: 5),
//               color: Colors.red,
//               child: Text('DISCOUNT',
//                 style: TextStyle(fontSize: 12.0,color: Colors.white),),
//
//             ),
//           ],
//         ),
//
//         Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(model.name!,
//               style: TextStyle(
//                 height: 1.2,
//               ),
//               maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               Row(
//                 children: [
//                   Text('Price:'),
//                   Text(' ${model.price}',
//                     style: TextStyle(
//                     fontSize: 13.0,
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold
//                     ),
//
//                   ),
//                   SizedBox(width: 5,),
//                   if(model.discount !=0)
//                   Text(' ${model.old_price}',
//                     style: TextStyle(
//                         fontSize: 13.0,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.bold
//                     ),
//
//                   ),
//                   Spacer(),
//                   IconButton(
//                   onPressed: (){}, icon: Icon(Icons.favorite_border,),),
//
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//
//     ),
//   );
// }
//
//
//
//
//

//**************************************************
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
// import 'package:untitled11/layout/shop_app/cubit/states.dart';
// import 'package:untitled11/models/home_model.dart';
//
// class  ProductsScreen extends StatelessWidget {
//   const  ProductsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopCubit,ShopStates>(
//      listener: (context,state){},
//         builder: (context,state){
//        var cubit=ShopCubit.get(context);
//        return ConditionalBuilder(
//            condition: cubit.homeModel !=null,
//            builder: (context)=>productsBuilder(cubit.homeModel!),
//            fallback: (context)=>Center(child: CircularProgressIndicator()));
//         }
//     );
//   }
//   Widget productsBuilder(HomeModel model)=>SingleChildScrollView(
//     child: Column(
//       children: [
//         CarouselSlider(
//             items:model.data!.banners.map((e) =>
//         Image(image: NetworkImage(e.image!),
//         fit: BoxFit.cover,
//           width: double.infinity,
//         )
//         ).toList() ,
//             options: CarouselOptions(
//               height: 250.0,
//               initialPage: 0,
//               viewportFraction: 1.0,
//               enableInfiniteScroll: false,
//               reverse: false,
//               autoPlay: true,
//               autoPlayCurve: Curves.fastOutSlowIn,
//
//               autoPlayAnimationDuration: Duration(seconds: 1),
//               autoPlayInterval: Duration(seconds: 5),
//               scrollDirection: Axis.horizontal,
//             )),
//         SizedBox(height: 10.0,),
//         Container(
//           color: Colors.grey[400],
//           child: GridView.count(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             crossAxisCount: 2,
//             crossAxisSpacing: 3.0,
//             mainAxisSpacing: 3.0,
//             childAspectRatio: 1/1.58,
//             children: List.generate(model.data!.products.length,
//                     (index) => gridBuilder(model.data!.products[index])),
//
//           ),
//         ),
//       ],
//     ),
//   );
//   Widget gridBuilder(ProductModel model)=>Container(
//     color: Colors.white,
//     child: Column(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomStart,
//           children: [
//             Image(image: NetworkImage(model.image!),
//             height: 200.0,
//               width: double.infinity,
//             ),
//             if(model.discount  !=0)
//             Container(
//               padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
//               color: Colors.red,
//               child: Text('DISCOUNT',
//                 style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(model.name!,
//               maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   height: 1.2,
//
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text('Price :',style: TextStyle(),),
//                   Text('${model.price}',
//                   style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(width: 10.0,),
//                   if(model.discount !=0)
//                   Text('${model.old_price}',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   Spacer(),
//                   IconButton(
//                     padding: EdgeInsetsDirectional.zero,
//                     onPressed: (){}, icon: Icon(Icons.favorite_border,),)
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//



//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$



import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
import 'package:untitled11/layout/shop_app/cubit/states.dart';
import 'package:untitled11/models/categories_model.dart';
import 'package:untitled11/models/change_favorites_model.dart';
import 'package:untitled11/models/home_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
    listener: (context,state){
      if(state is ShopSuccessChangeFavoritesStates)
        {
          if(!state.model.status!)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // color: Colors.red,
                        height: 70,
                        child: Text(state.model.message!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  )
              );
            }
        }
    },
      builder: (context,state){
      var cubit=ShopCubit.get(context);
      return ConditionalBuilder(
          condition: cubit.homeModel !=null && cubit.categoriesModel !=null ,
          builder:  (context)=>productBuild(cubit.homeModel!,cubit.categoriesModel!,context),
          fallback: (context)=>Center(child: CircularProgressIndicator()));
      },
    );
  }
  Widget productBuild(HomeModel model, CategoriesModel categoriesModel,context)=>SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: model.data!.banners.map((e) =>
        Image(image: NetworkImage(e.image!),
        fit: BoxFit.cover,
          width: double.infinity,
        ),
        ).toList(),
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayInterval: Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
            )),
        SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cateogries : ',
                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 10.0,),
              Container(

              height: 100.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=> buildCategoriesItem(categoriesModel.data!.data[index]),
                  separatorBuilder:  (context,index)=> SizedBox(width: 10.0,),
                  itemCount: categoriesModel.data!.data.length),
      ),
              SizedBox(height: 15.0,),
              Text('New Products : ',
                style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        SizedBox(height: 15.0,),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
            childAspectRatio: 1/1.5,
            children: List.generate(model.data!.products.length,
                    (index) =>gridBuild(model.data!.products[index],context),
            ),



          ),
        )
      ],
    ),
  );
  Widget gridBuild(ProductModel model,context )=>Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(image: NetworkImage(model.image!),

              height: 200.0,
              width: double.infinity,

            ),
            if(model.discount !=0)
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
              color: Colors.red,
              child: Text('DISCOUNT',
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            ),

          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name!,
                maxLines: 2,
                style: TextStyle(
                  height: 1.2,
                ),),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text('Price : ',),
                  Text(model.price.toString(),
                    style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.blue),),
                  SizedBox(width: 5.0,),
                  if(model.discount !=0)

                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Text(model.old_price.toString(),
                        style: TextStyle(color: Colors.black54),),
                      Container(
                        height: 1.0,
                        width: 50.0,
                        color: Colors.red,

                      ),
                    ],
                  ),
                  Spacer(),
                 IconButton(

                   onPressed: (){
                  ShopCubit.get(context).changeFavorites(model.id!);
                   },
                   icon:ShopCubit.get(context).favorites[model.id]! ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border_outlined),

                 ),


                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget buildCategoriesItem(DataModel model)=>  Stack(
    alignment: AlignmentDirectional.bottomStart,
    children: [
      Image(image: NetworkImage(model.image!),
        width: 100.0,
        height: 100.0,
        fit: BoxFit.cover,
      ),
      Container(
        width: 100.0,
        color: Colors.black.withOpacity(0.8),
        child: Text(model.name!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),),
      ),
    ],
  );

}

