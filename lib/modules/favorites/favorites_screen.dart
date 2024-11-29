// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
// import 'package:untitled11/layout/shop_app/cubit/states.dart';
// import 'package:untitled11/models/favorites_model.dart';
// import 'package:untitled11/shared/components/components.dart';
//
// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopCubit,ShopStates>(
//      listener: (context,state){
//
//      },
//       builder: (context,state){
//        var cubit=ShopCubit.get(context);
//        return ConditionalBuilder(
//          condition:cubit.favoritesModel !=null && state is! ShopLoadingGetFavoritesStates ,
//         builder: (context)=> ListView.separated(
//             itemBuilder:(context,index)=> buildFavoritesItem(cubit.favoritesModel!.data!.data[index],context) ,
//             separatorBuilder: (context,index)=>Padding(
//               padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
//               child: Container(height: 1.0,width: double.infinity,color: Colors.grey,),
//             ),
//             itemCount: cubit.favoritesModel!.data!.data.length),
//          fallback: (context)=> Center(child: CircularProgressIndicator()),
//        );
//       },
//     );
//   }
//   Widget buildFavoritesItem(FavoritesData model,context)=>Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Container(
//       height: 100.0,
//
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Stack(
//             alignment: AlignmentDirectional.bottomStart,
//             children: [
//               Image(image: NetworkImage(model.product!.image!),
//
//
//                 height: 100.0,
//                 width:100,
//
//               ),
//               if(model.product!.discount !=0)
//                 Container(
//                   padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
//                   color: Colors.red,
//                   child: Text('DISCOUNT',
//                     style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
//                 ),
//
//             ],
//           ),
//           SizedBox(width: 10.0,),
//
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(model.product!.name!,
//                   maxLines: 2,
//                   style: TextStyle(
//                     height: 1.2,
//                   ),),
//                 Spacer(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text('Price : ',),
//                     Text(model.product!.price.toString(),
//                       style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.blue),),
//                     SizedBox(width: 5.0,),
//                     if(model.product!.discount !=0)
//                       Text(model.product!.old_price.toString(),
//                         style: TextStyle(color: Colors.black54),),
//                     Spacer(),
//                     IconButton(
//
//                       onPressed: (){
//                         ShopCubit.get(context).changeFavorites(model.product!.id!);
//                       },
//                       icon: ShopCubit.get(context).favorites[model.product!.id!]! ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border_outlined),
//
//                     ),
//
//
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
import 'package:untitled11/layout/shop_app/cubit/states.dart';
import 'package:untitled11/models/favorites_model.dart';
import 'package:untitled11/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
     listener: (context,state){

     },
      builder: (context,state){
       var cubit=ShopCubit.get(context);
       return ConditionalBuilder(
         condition: state is! ShopChangeFavoritesStates  && cubit.homeModel !=null ,
         builder: (context)=>ListView.separated(itemBuilder: (context,index)=>buildListProduct(cubit.favoritesModel!.data!.data[index].product!,context),
             separatorBuilder:  (context,index)=>MyDivider(),
             itemCount: cubit.favoritesModel!.data!.data.length),
         fallback: (context)=>Center(child: CircularProgressIndicator()),
       );
      },
    );
  }
  // Widget buildFavoritesItem(Product model,context)=> Padding(
  //   padding: const EdgeInsets.all(20.0),
  //   child: Container(
  //     height: 100.0,
  //     width: double.infinity,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Stack(
  //           alignment: AlignmentDirectional.bottomStart,
  //           children: [
  //             Image(image: NetworkImage(model.image!),
  //
  //               height: 100.0,
  //               width: 100.0,
  //
  //             ),
  //             if(model.discount !=0)
  //               Container(
  //                 padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
  //                 color: Colors.red,
  //                 child: Text('DISCOUNT',
  //                   style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
  //               ),
  //
  //           ],
  //         ),
  //         SizedBox(width: 15.0,),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(model.name!,
  //                 maxLines: 2,
  //                 style: TextStyle(
  //                   height: 1.2,
  //                 ),),
  //               Spacer(),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text('Price : ',),
  //                   Text(model.price.toString(),
  //                     style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.blue),),
  //                   SizedBox(width: 5.0,),
  //                   if(model.discount !=0)
  //                     Text(model.old_price.toString(),
  //                       style: TextStyle(color: Colors.black54),),
  //                   Spacer(),
  //                   IconButton(
  //
  //                     onPressed: (){
  //                       ShopCubit.get(context).changeFavorites(model.id!);
  //                     },
  //                     icon:ShopCubit.get(context).favorites[model.id!]! ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border_outlined),
  //
  //                   ),
  //
  //
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}
