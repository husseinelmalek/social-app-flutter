import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/modules/shop_app/shop_login_screen/shop_login_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import 'package:untitled/shared/styles/colors.dart';

class BoardingModel{
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
   OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding=[
    BoardingModel(
        image:'assets/images/onboard.png',
        title:'on board Screen title 1',
        body:'onboard body 1'),
    BoardingModel(
        image:'assets/images/onboard.png',
        title:'on board Screen title 2',
        body:'onboard body 2'),
    BoardingModel(
        image:'assets/images/onboard.png',
        title:'on board Screen title 3',
        body:'onboard body 3'),

  ];

  var boardController = PageController();
  bool isLast=false;

void onSubmit(){
  CacheHelper.saveData(key: 'onBoarding', value: true).then(
          (value) {
            if(value){
            navigateAndFinish(context, ShopLoginScreen());
            }

          });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed:onSubmit,
            child: Text('SKIP'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (value) {
                  if(value == boarding.length-1){
                    setState(() {
                      isLast=true;
                    });
                  }else {
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                itemBuilder:(context, index) => BuildBoardingItem(boarding[index]),
              itemCount: boarding.length,
              ),
            ),
            SizedBox(height: 40.0,),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defaultColor,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,

                    ),
                    count: boarding.length),
                Spacer(),
                FloatingActionButton(onPressed:() {
                  if(isLast==false){
                    boardController.nextPage(duration: Duration(
                      milliseconds: 750,
                    ),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }else {
                    onSubmit();
                  }


                },
                child: Icon(Icons.arrow_forward_ios),
                )

              ],
            ),

          ],
        ),
      ),

    );
  }

  Widget BuildBoardingItem(BoardingModel board) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image(image: AssetImage('${board.image}') )),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${board.title}',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Text(
        '${board.body}',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),



    ],
  );
}
