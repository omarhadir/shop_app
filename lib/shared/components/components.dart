
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled11/layout/shop_app/cubit/cubit.dart';

void NavigateTo(context,widget)=>Navigator.push(
    context, MaterialPageRoute(builder: (context)=>widget));

void NavigateAndFinish(context,widget)=> Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context)=>widget), (route) => false);

Widget MyDivider()=> Padding(
  padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
  child: Container(height: 1.0,width: double.infinity,color: Colors.grey,),
);

Widget buildListProduct( model,context,{bool isOldPrice=true})=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 100.0,
    width: double.infinity,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(image: NetworkImage(model.image!),

              height: 100.0,
              width: 100.0,

            ),
            if(model.discount !=0 && isOldPrice)
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
                color: Colors.red,
                child: Text('DISCOUNT',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              ),

          ],
        ),
        SizedBox(width: 15.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name!,
                maxLines: 2,
                style: TextStyle(
                  height: 1.2,
                ),),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Price : ',),
                  Text(model.price.toString(),
                    style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.blue),),
                  SizedBox(width: 5.0,),
                  if(model.discount !=0 && isOldPrice)
                    Text(model.old_price.toString(),
                      style: TextStyle(color: Colors.black54),),
                  Spacer(),
                  IconButton(

                    onPressed: (){
                      ShopCubit.get(context).changeFavorites(model.id!);
                    },
                    icon:ShopCubit.get(context).favorites[model.id!]! ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border_outlined),

                  ),


                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);


void showToast({
  required String msg,
  required ToastState state,
})=> Fluttertoast.showToast(
  msg: msg,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: choseToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0,
);

enum ToastState{SUCCESS,WARNING,ERROR}

Color choseToastColor(ToastState state)
{
  Color color;
  switch(state)
     {
    case ToastState.SUCCESS:
      color=Colors.green;
      break;
    case ToastState.WARNING:
      color=Colors.amber;
      break;
    case ToastState.ERROR:
      color=Colors.red;
      break;



  }

return color ;
}
