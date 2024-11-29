//
//
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:untitled11/modules/shop_login/shop_login_screen.dart';
// import 'package:untitled11/shared/components/components.dart';
//
// class BoardingModel
// {
//   final String image;
//   final String title;
//   final String body;
//   BoardingModel({
//     required this.image,
//     required this.title,
//     required this.body,
//
// });
//
// }
//
// class OnBoardingScreen extends StatefulWidget {
//    OnBoardingScreen({super.key});
//
//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//    var boardController=PageController();
//    List<BoardingModel>boarding=[
//      BoardingModel(image:'assets/images/سلة_مبيعات-removebg-preview.png' ,
//          title: 'On Board 1 title',
//          body: 'On Board 1 body'),
//      BoardingModel(image:'assets/images/shop_onlin-removebg-preview.png' ,
//          title: 'On Board 2 title',
//          body: 'On Board 2 body'),
//      BoardingModel(image:'assets/images/onboarding-removebg-preview.png' ,
//          title: 'On Board 3 title',
//          body: 'On Board 3 body'),
//    ];
//    bool isLast=false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           TextButton(onPressed: (){
//             NavigateAndFinish(context, ShopLoginScreen());
//           }, child: Text('Skip',
//             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),))
//         ],
//       ),
//       body:Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: PageView.builder(itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
//               itemCount: 3,
//                 controller:boardController ,
//                 onPageChanged: (int index)
//                 {
//                   if(index==boarding.length-1)
//                     {
//                       setState(() {
//                         isLast=true;
//                         print('last');
//                       });
//                     }else
//                       {
//                         setState(() {
//                           isLast=false;
//                         });
//                       }
//                 },
//               ),
//             ),
//             SizedBox(height: 20.0,),
//             Row(
//               children: [
//                 SmoothPageIndicator(
//                   controller: boardController,
//                   count: 3,
//                   effect: ExpandingDotsEffect(
//                     dotWidth: 10.0,
//                     dotHeight: 10.0,
//                     activeDotColor: Colors.blue,
//                     spacing: 4,
//                     expansionFactor: 4,
//                   ),
//
//                 ),
//                 Spacer(),
//                 FloatingActionButton(
//                   onPressed: (){
//                   if(isLast)
//                     {
//                       NavigateAndFinish(context, ShopLoginScreen());
//                     }else
//                       {
//                         boardController.nextPage(duration: Duration(
//                           milliseconds: 750,
//                         ), curve: Curves.fastLinearToSlowEaseIn);
//                       }
//                 },child: Icon(Icons.arrow_forward_ios),),
//
//               ],
//             ),
//
//
//           ],
//         ),
//       ),
//
//     );
//   }
//
//   Widget buildBoardingItem(BoardingModel model)=> Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Expanded(
//           child: Center(child: Image(image: AssetImage('${model.image}')))),
//       SizedBox(height: 20.0,),
//       Text('${model.title}',
//         style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
//       SizedBox(height: 10.0,),
//       Text('${model.body}',
//         style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
//     ],
//   ) ;
// }

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled11/modules/shop_login/shop_login_screen.dart';
import 'package:untitled11/shared/components/components.dart';
import 'package:untitled11/shared/network/local/cashe_helper.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
});
}

class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController=PageController();

  List<BoardingModel> boarding=[
    BoardingModel(
        image: 'assets/images/سلة_مبيعات-removebg-preview.png',
        title: 'On Board 1 title ',
        body: 'On Board 1 body'),
    BoardingModel(
        image: 'assets/images/shop_onlin-removebg-preview.png',
        title: 'On Board 2 title ',
        body: 'On Board 2 body'),
    BoardingModel(
        image: 'assets/images/onboarding-removebg-preview.png',
        title: 'On Board 3 title ',
        body: 'On Board 3 body'),
  ];

  bool isLast=false;
  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true,).then((value) {
      if(value)
        {
          NavigateAndFinish(context, ShopLoginScreen());
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
              submit();
              }, child: Text('Skip',
            style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
                itemCount: 3,
                controller:boardController ,
                onPageChanged: (int index)
                {
                  if(index==boarding.length-1)
                    {
                      setState(() {
                        isLast=true;
                        print('last');
                      });
                    }else
                      {
                        isLast=false;
                      }
                },
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                    count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight:  10.0,
                    dotWidth: 10.0,
                    activeDotColor: Colors.blue,
                    offset: 4,
                    expansionFactor: 4,
                  ),

                ),
                Spacer(),
                FloatingActionButton(onPressed: (){
                  if(isLast)
                    {
                     submit();
                    }else
                      {
                        boardController.nextPage(duration: Duration(
                          milliseconds: 750,
                        ), curve: Curves.fastLinearToSlowEaseIn);
                      }

                },child: Icon(Icons.arrow_forward_ios),),
              ],
            )

          ],
        ),
      ) ,
    );
  }

  Widget buildBoardingItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Center(child: Image(image: AssetImage('${model.image}'),))),
      SizedBox(height: 20.0,),
      Text('${model.title}',
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0),),
      SizedBox(height: 10.0,),
      Text('${model.body}',
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0),),
    ],
  );
}
