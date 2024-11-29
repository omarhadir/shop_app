import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled11/modules/search/cubit/cubit.dart';
import 'package:untitled11/modules/search/cubit/states.dart';
import 'package:untitled11/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

  var formKey=GlobalKey<FormState>();
  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) =>SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchStates>(
       listener: (context,state){},
        builder: (context,state){
         var cubit=SearchCubit.get(context);
         return  Scaffold(
           appBar: AppBar(),

           body: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Form(
               key: formKey,
               child: Column(
                 children: [
                   TextFormField(
                     validator: (String?value){
                       if(value!.isEmpty)
                         {
                           return 'Enter your Search';
                         }else
                           {
                             return null;
                           }
                     },
                     controller: searchController,
                     onChanged: (String text){
                       cubit.searchData(text);
                     },
                     decoration: InputDecoration(
                       label: Text('Search'),
                       border: OutlineInputBorder(),
                       prefixIcon: Icon(Icons.search),
                     ),
                   ),
                   SizedBox(height: 10.0,),
                   if(state is SearchLoadingStates)
                     LinearProgressIndicator(),
                   SizedBox(height: 10.0,),
                   if(state is SearchSuccessStates && cubit.searchModel !=null)
                   Expanded(
                     child: ListView.separated(itemBuilder: (context,index)=>buildListProduct(cubit.searchModel!.data!.data[index],context,isOldPrice: false),
                         separatorBuilder:  (context,index)=>MyDivider(),
                         itemCount: cubit.searchModel!.data!.data.length),
                   ),
                 ],
               ),
             ),
           ),
         );
        },
      ),
    );
  }
}
