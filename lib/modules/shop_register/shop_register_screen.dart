import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/modules/shop_register/cubit/cubit.dart';
import 'package:untitled11/modules/shop_register/cubit/states.dart';
import 'package:untitled11/shared/components/components.dart';

import '../../layout/shop_app/shop_layout.dart';
import '../../shared/network/local/cashe_helper.dart';

class ShopRegisterScreen extends StatelessWidget {
   ShopRegisterScreen({super.key});
   var nameController=TextEditingController();
   var emailController=TextEditingController();
   var passwordController=TextEditingController();
   var phoneController=TextEditingController();

   var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  BlocProvider(
        create: (BuildContext context) =>RegisterCubit(),
        child: BlocConsumer<RegisterCubit,RegisterStates>(
         listener: (context,state){
           if(state is RegisterSuccessStates)
           {
             if(state.loginModel.status!)
             {
               print(state.loginModel.message);
               print(state.loginModel.data!.token);

               CacheHelper.saveData(
                   key: 'token',
                   value: state.loginModel.data!.token).then((value) {
                     // var token=state.loginModel.data!.token;
                     // print(token);

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
           var cubit=RegisterCubit.get(context);
           return Center(
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Form(
                   key: formKey,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Register',
                         style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                       SizedBox(height: 10.0,),
                       Text('Register now for browse our offers',
                           style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54)),
                       SizedBox(height: 30.0,),
                       TextFormField(
                         keyboardType: TextInputType.text,
                         validator: (value){
                           if(value!.isEmpty)
                             return 'Please enter your name';
                         },
                         controller: nameController,
                         decoration: InputDecoration(
                           label: Text('User Name'),
                           border: OutlineInputBorder(),
                           prefixIcon: Icon(Icons.account_circle),
                         ),
                       ),
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
                       TextFormField(
                         keyboardType: TextInputType.phone,
                         validator: (value){
                           if(value!.isEmpty)
                             return 'Please enter your phone';
                         },
                         controller: phoneController,
                         decoration: InputDecoration(
                           label: Text('Phone'),
                           border: OutlineInputBorder(),
                           prefixIcon: Icon(Icons.phone),
                         ),
                       ),
                       SizedBox(height: 30.0,),
                       ConditionalBuilder(
                         condition: state is! RegisterLoadingStates,
                         builder:(context)=>Container(
                             height: 50.0,
                             width: double.infinity,
                             color: Colors.blue,
                             child: MaterialButton(
                               onPressed: ()
                               {
                                 if(formKey.currentState!.validate())
                                 {

                                   cubit.userRegister(
                                       name: nameController.text,
                                       email: emailController.text,
                                       password: passwordController.text,
                                       phone: phoneController.text);

                                 }
                               },
                               child: Text('Register',
                                 style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.white),),)) ,
                         fallback: (context)=>Center(child: CircularProgressIndicator()),
                       ),




                     ],
                   ),
                 ),
               ),
             ),
           );
          },
        ),
      ),
    );
  }
}
