//
//
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled11/modules/shop_login/cubit/cubit.dart';
// import 'package:untitled11/modules/shop_login/cubit/states.dart';
// import 'package:untitled11/modules/shop_register/shop_register_screen.dart';
// import 'package:untitled11/shared/components/components.dart';
//
// class ShopLoginScreen extends StatelessWidget {
//    ShopLoginScreen({super.key});
//
//    var formKey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//
//     var emailController=TextEditingController();
//     var passwordController=TextEditingController();
//     return Scaffold(
//       appBar: AppBar(),
//       body: BlocProvider(
//         create: (BuildContext context) =>LoginCubit(),
//         child: BlocConsumer<LoginCubit,LoginStates>(
//           listener: (context,state){},
//           builder: (context,state){
//             var cubit=LoginCubit.get(context);
//             return Center(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('LOGIN',
//                           style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
//                         SizedBox(height: 10.0,),
//                         Text('Login now for browse our offers ',
//                           style: Theme.of(context).textTheme.headline5!.copyWith(
//                               color: Colors.black54
//                           ),),
//                         SizedBox(height: 30.0,),
//                         TextFormField(
//
//                           controller: emailController,
//                           validator: (String? value)
//                           {
//                             if(value!.isEmpty)
//                               return 'Please enter your email password ';
//                           },
//                           decoration: InputDecoration(
//                             label: Text('Email Address'),
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.email),
//
//                           ),
//                         ),
//                         SizedBox(height: 20.0,),
//                         TextFormField(
//                           obscureText: cubit.isPassword,
//
//                           controller: passwordController,
//                           validator: (String? value)
//                           {
//                             if(value!.isEmpty)
//                               return 'Password is too short ';
//                           },
//                           decoration: InputDecoration(
//                             label: Text('Password'),
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.lock),
//                             suffixIcon: IconButton(onPressed: (){
//                               cubit.changeShownVisibility();
//
//                             },
//                                 icon:cubit.isPassword? Icon(Icons.visibility_off):Icon(Icons.visibility,)),
//
//                           ),
//                         ),
//                         SizedBox(height: 30.0,),
//
//                         ConditionalBuilder(
//                          condition: state is! LoginLoadingStates,
//                           builder: (context)=>Container(
//                               height: 50.0,
//                               width: double.infinity,
//                               color: Colors.blue,
//                               child: MaterialButton(onPressed: (){
//                                 if(formKey.currentState!.validate())
//                                 {
//                                   // print('omar');
//                                  LoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);
//                                 }
//
//                               },child: Text('Login',style: TextStyle(fontSize: 25.0,color: Colors.white),),)),
//                           fallback:(context)=> Center(child: CircularProgressIndicator()),
//                         ),
//                         SizedBox(height: 15.0,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text('Don\'t have an account',style: TextStyle(fontSize: 15.0),),
//                             TextButton(onPressed: (){
//                               NavigateTo(context, ShopRegisterScreen());
//                             }, child: Text('REGISTER')),
//                           ],
//                         ),
//
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled11/layout/shop_app/shop_layout.dart';
import 'package:untitled11/modules/shop_login/cubit/cubit.dart';
import 'package:untitled11/modules/shop_login/cubit/states.dart';
import 'package:untitled11/modules/shop_register/shop_register_screen.dart';
import 'package:untitled11/shared/components/components.dart';
import 'package:untitled11/shared/components/constants.dart';
import 'package:untitled11/shared/network/local/cashe_helper.dart';

class ShopLoginScreen extends StatelessWidget {
   // ShopLoginScreen({super.key});
   var emailController=TextEditingController();
   var passwordController=TextEditingController();
   var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (BuildContext context) =>LoginCubit(),
          child: BlocConsumer<LoginCubit,LoginStates>(
           listener: (context,state){
             if(state is LoginSuccessStates)
               {
                 if(state.loginModel.status!)
                   {
                     print(state.loginModel.message);
                     print(state.loginModel.data!.token);

                   CacheHelper.saveData(
                       key: 'token',
                       value: state.loginModel.data!.token).then((value) {
                         token=state.loginModel.data!.token;
                   NavigateAndFinish(context, ShopLayout());
                   });
                   }else
                     {
                       ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                             content: Container(
                                 decoration: BoxDecoration(
                                   color: Colors.red,
                                   borderRadius: BorderRadius.circular(10.0),
                                 ),
                                 // color: Colors.red,
                                 height: 50,
                                 child: Text(state.loginModel.message!,
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
             var cubit=LoginCubit.get(context);
             return Form(
               key: formKey,
               child: Center(
                 child: SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('LOGIN',
                         style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                       SizedBox(height: 10.0,),
                       Text('Login now for browse our offers',
                           style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54)),
                       SizedBox(height: 30.0,),
                       TextFormField(
                         keyboardType: TextInputType.emailAddress,
                         validator: (value){
                           if(value!.isEmpty)
                             return 'Please enter your email address';
                         },
                         controller: emailController,
                         decoration: InputDecoration(
                           label: Text('Email Address'),
                           border: OutlineInputBorder(),
                           prefixIcon: Icon(Icons.email),
                         ),
                       ),
                       SizedBox(height: 20.0,),
                       TextFormField(

                         obscureText: cubit.isPassword,
                         keyboardType: TextInputType.text,
                         validator: (value){
                           if(value!.isEmpty)
                             return 'Please enter  Password';
                         },
                         controller: passwordController,
                         decoration: InputDecoration(
                           label: Text('Password'),
                           border: OutlineInputBorder(),
                           prefixIcon: Icon(Icons.lock),
                           suffixIcon: IconButton(onPressed: (){
                             cubit.changeShownVisibility();
                           }, icon: cubit.isPassword ? Icon(Icons.visibility_off) :Icon(Icons.visibility),),

                         ),
                       ),
                       SizedBox(height: 30.0,),
                       ConditionalBuilder(
                         condition: state is! LoginLoadingStates,
                         builder:(context)=>Container(
                             height: 50.0,
                             width: double.infinity,
                             color: Colors.blue,
                             child: MaterialButton(
                               onPressed: ()
                               {
                                 if(formKey.currentState!.validate())
                                 {
                                   cubit.userLogin(
                                       email: emailController.text,
                                       password: passwordController.text);
                                 }
                               },
                               child: Text('Login',
                                 style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.white),),)) ,
                         fallback: (context)=>Center(child: CircularProgressIndicator()),
                       ),
                       SizedBox(height: 10.0,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Don\'t have account ? ',style: TextStyle(fontSize: 18.0),),
                           TextButton(onPressed: (){
                             NavigateTo(context, ShopRegisterScreen());
                           }, child: Text('REGISTER',style: TextStyle(fontSize: 18.0),),),

                         ],
                       ),


                     ],
                   ),
                 ),
               ),
             );
            },
          ),
        ),
      ),
    );
  }
}
