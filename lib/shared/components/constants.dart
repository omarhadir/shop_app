
import 'package:flutter/material.dart';
import 'package:untitled11/modules/shop_login/shop_login_screen.dart';
import 'package:untitled11/shared/components/components.dart';
import 'package:untitled11/shared/network/local/cashe_helper.dart';

void singOut(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      NavigateAndFinish(context, ShopLoginScreen());
    }
  });
}

void printFullText(String? text)
{
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text!).forEach((match) =>print(match.group(0)));
}

String? token='';