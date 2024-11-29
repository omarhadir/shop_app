// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
// import 'package:untitled11/layout/shop_app/cubit/states.dart';
// import 'package:untitled11/shared/components/constants.dart';
//
// class SettingScreen extends StatelessWidget {
//    SettingScreen({super.key});
//
//   var nameController=TextEditingController();
//   var emailController=TextEditingController();
//   var phoneController=TextEditingController();
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<ShopCubit,ShopStates>(
//      listener: (context,state){
//
//
//        // var cubit=ShopCubit.get(context);
//        // var model=cubit.userModel;
//        // nameController.text=model!.data!.name!;
//        //  emailController.text=model!.data!.email!;
//        //  phoneController.text=model!.data!.phone!;
//
//      },
//       builder: (context,state){
//
//       var cubit=ShopCubit.get(context);
//
//       if(cubit.userModel != null )
//         {
//           nameController.text=cubit.userModel!.data!.name!;
//           emailController.text=cubit.userModel!.data!.email!;
//           phoneController.text=cubit.userModel!.data!.phone!;
//         }
//
//
//
//        return ConditionalBuilder(
//         condition:cubit.userModel != null   ,
//          builder: (context)=>Padding(
//            padding: const EdgeInsets.all(20.0),
//            child: Column(
//              children: [
//                TextFormField(
//                  keyboardType: TextInputType.name,
//                  controller:nameController ,
//                  validator: (String? value)
//                  {
//                    if(value!.isEmpty)
//                    {
//                      return 'Please Enter your Name';
//                    }else
//                    {
//                      return null;
//                    }
//                  },
//                  decoration: InputDecoration(
//
//                    label: Text('Name'),
//                    border: OutlineInputBorder(),
//                    prefixIcon: Icon(Icons.person),
//                  ),
//                ),
//                SizedBox(height: 20.0,),
//                TextFormField(
//                  keyboardType: TextInputType.emailAddress,
//                  controller:emailController ,
//                  validator: (String? value)
//                  {
//                    if(value!.isEmpty)
//                    {
//                      return 'Please Enter your Email Address';
//                    }else
//                    {
//                      return null;
//                    }
//                  },
//                  decoration: InputDecoration(
//
//                    label: Text('Email Address'),
//                    border: OutlineInputBorder(),
//                    prefixIcon: Icon(Icons.email_outlined),
//                  ),
//                ),
//                SizedBox(height: 20.0,),
//                TextFormField(
//                  controller:phoneController ,
//                  validator: (String? value)
//                  {
//                    if(value!.isEmpty)
//                    {
//                      return 'Please Enter your Phone Number';
//                    }else
//                    {
//                      return null;
//                    }
//                  },
//                  decoration: InputDecoration(
//
//                    label: Text('Phone'),
//                    border: OutlineInputBorder(),
//                    prefixIcon: Icon(Icons.phone),
//                  ),
//                ),
//                SizedBox(height: 25.0,),
//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Container(
//                    height: 60.0,
//                    width: double.infinity,
//                    color: Colors.blue,
//                    child: MaterialButton(
//                      onPressed: (){
//                        singOut(context);
//                      },child: Text('LOGOUT',
//                      style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          fallback: (context)=>Center(child: CircularProgressIndicator()),
//        );
//       },
//
//     );
//   }
// }


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/layout/shop_app/cubit/cubit.dart';
import 'package:untitled11/layout/shop_app/cubit/states.dart';
import 'package:untitled11/shared/components/constants.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({super.key});

   var formKey=GlobalKey<FormState>();
  // var nameController=TextEditingController();
  // var emailController=TextEditingController();
  // var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
     listener: (context,state){
       // if(state is ShopSuccessUpdateUserStates)
       //   {
       //     if(state.model.status!)
       //       {
       //         ShopCubit.get(context).nameController.text=state.model.data!.name!;
       //         ShopCubit.get(context).emailController.text=state.model.data!.email!;
       //         ShopCubit.get(context).phoneController.text=state.model.data!.phone!;
       //
       //       }
       //
       //   }

     },
      builder: (context,state){
       var cubit=ShopCubit.get(context);
       if(cubit.userModel != null)
         {
          cubit. nameController.text=cubit.userModel!.data!.name!;
          cubit. emailController.text=cubit.userModel!.data!.email!;
           cubit.phoneController.text=cubit.userModel!.data!.phone!;
         }
       return ConditionalBuilder(
        condition:cubit.userModel != null,
         builder: (context)=>Padding(
           padding: const EdgeInsets.all(20.0),
           child: Form(
             key: formKey,
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   if(state is ShopLoadingUpdateUserStates)
                     LinearProgressIndicator(),
                   SizedBox(height: 20.0,),
                   TextFormField(
                     keyboardType: TextInputType.name,
                     controller:cubit.nameController ,
                     validator: (String? value){
                       if(value!.isEmpty)
                       {
                         return 'Please Enter your Name';
                       }else
                       {
                         return null;
                       }
                     },
                     decoration: InputDecoration(
                       label: Text('Name'),
                       border: OutlineInputBorder(),
                       prefixIcon: Icon(Icons.person),

                     ),
                   ),
                   SizedBox(height: 20.0,),
                   TextFormField(
                     keyboardType: TextInputType.emailAddress,

                     controller:cubit.emailController ,
                     validator: (String? value){
                       if(value!.isEmpty)
                       {
                         return 'Please Enter your Email Address';
                       }else
                       {
                         return null;
                       }
                     },
                     decoration: InputDecoration(
                       label: Text('Email Address'),
                       border: OutlineInputBorder(),
                       prefixIcon: Icon(Icons.email),

                     ),
                   ),
                   SizedBox(height: 20.0,),
                   TextFormField(
                     keyboardType: TextInputType.phone,
                     controller:cubit.phoneController ,
                     validator: (String? value){
                       if(value!.isEmpty)
                       {
                         return 'Please Enter your Phone Number';
                       }else
                       {
                         return null;
                       }
                     },
                     decoration: InputDecoration(
                       label: Text('Phone'),
                       border: OutlineInputBorder(),
                       prefixIcon: Icon(Icons.phone),

                     ),
                   ),
                   SizedBox(height: 25.0,),
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Container(
                       height: 60.0,
                       width: double.infinity,
                       color: Colors.blue,
                       child: MaterialButton(onPressed: ()
                       {
                         if(formKey.currentState!.validate())
                           {
                             cubit.updateUser(name:cubit.nameController.text,
                                 email: cubit.emailController.text,
                                 phone: cubit.phoneController.text);


                           }
                       },child: Text('UPDATE',
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white),),),
                     ),
                   ),
                   SizedBox(height: 5.0,),
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Container(
                       height: 60.0,
                       width: double.infinity,
                       color: Colors.blue,
                       child: MaterialButton(onPressed: ()
                       {
                         singOut(context);
                       },child: Text('LOGOUT',
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white),),),
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ),
         fallback: (context)=>Center(child: CircularProgressIndicator()),
       );
      },
    );
  }
}
