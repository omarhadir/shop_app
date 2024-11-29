// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
// import 'package:untitled11/layout/shop_app/cubit/states.dart';
// import 'package:untitled11/models/categories_model.dart';
//
// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: BlocConsumer<ShopCubit,ShopStates>(
//        listener: (context,state){},
//         builder: (context,state){
//          var cubit=ShopCubit.get(context);
//          return ConditionalBuilder(
//           condition: cubit.categoriesModel != null,
//            builder: (context)=>ListView.separated(itemBuilder: (context,index)=> buildCatItem(cubit.categoriesModel!.data!.data[index]),
//                separatorBuilder: (context,index)=>Padding(
//                  padding: const EdgeInsets.all(20.0),
//                  child: Container(height: 1.0,width: double.infinity,color: Colors.grey,),
//                ),
//                itemCount: cubit.categoriesModel!.data!.data.length),
//            fallback: (context)=>Center(child: CircularProgressIndicator()),
//          );
//         },
//       ),
//     );
//   }
//   Widget buildCatItem(DataModel  model)=>Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Row(
//       children: [
//         Image(image: NetworkImage(model.image!),
//           height: 100.0,
//           width: 100.0,
//           fit: BoxFit.cover,
//         ),
//         SizedBox(width: 20.0,),
//         Text(model.name!,
//           style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
//         Spacer(),
//         IconButton(
//           onPressed: (){}, icon: Icon(Icons.arrow_forward_ios),),
//       ],
//     ),
//   );
// }

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
import 'package:untitled11/layout/shop_app/cubit/states.dart';
import 'package:untitled11/models/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
     listener: (context,state){},
      builder: (context,state){
       var cubit=ShopCubit.get(context);
       return  ConditionalBuilder(condition: cubit.categoriesModel !=null,
           builder: (context)=>ListView.separated(
               itemBuilder: (context,index)=>buildCategoriesItem(cubit.categoriesModel!.data!.data[index]),
               separatorBuilder: (context,index)=>Padding(
                 padding: const EdgeInsetsDirectional.only(start: 20.0),
                 child: Container(height: 1.0,width: double.infinity,color: Colors.grey,),
               ),
               itemCount: cubit.categoriesModel!.data!.data.length),
           fallback: (context)=>Center(child: CircularProgressIndicator()));
      },
    );

  }
  Widget buildCategoriesItem(DataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(image: NetworkImage(model.image!),
        height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10,),
        Text(model.name!,
          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,),),

      ],
    ),
  );
}
