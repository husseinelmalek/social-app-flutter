
import 'package:flutter/material.dart';
import 'package:untitled/shared/styles/colors.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image(image: NetworkImage('https://img.freepik.com/free-photo/portrait-young-beautiful-woman-gesticulating_273609-40303.jpg?t=st=1678016380~exp=1678016980~hmac=1711d7ee46fe0b84e580e54e16483899f83a6d70cdb0f60d62590e84bf0734d5'),
           fit: BoxFit.cover,
                  height: 200.0,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('communicate with friends',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Colors.white,
                    )
                  ),
                ),
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
          ),
          ListView.separated(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => buildPostItem(context),
              separatorBuilder: (context, index) => SizedBox(height: 8.0,),
              itemCount: 10),
          SizedBox(height: 8.0,)
        ],
      ),
    );
  }

  Widget buildPostItem(context)=>Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('https://img.freepik.com/free-photo/close-up-portrait-gorgeous-young-woman_273609-40597.jpg?t=st=1678018276~exp=1678018876~hmac=6e7e62911c251b986131f79336249c052139ae33759f5276b142d40a70d48ae5'),

              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('hussein said',
                          style: TextStyle(
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Icon(Icons.check_circle,
                          color: defaultColor,
                          size: 16.0,
                        ),
                      ],
                    ),
                    Text('March 5,2023 at 2:26 pm',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                        height: 1.4,
                      ),
                    )
                  ],

                ),
              ),
              SizedBox(width: 10.0,),
              IconButton(onPressed: () {

              }, icon: Icon(Icons.more_horiz,size: 16.0,)
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey,

            ),
          ),
          Text('I took the PSAT on Wednesday and the vocabulary section '
              'was a breeze. Keep doing what you do, your website has helped me so much!',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Container(
              width: double.infinity,

              child: Wrap(

                children: [

                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        end: 5.0
                    ),
                    child: Container(
                      height: 25.0,
                      child: MaterialButton(
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          onPressed: () {

                          }, child: Text('#software',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                          color: defaultColor,
                        ),
                      )
                      ),
                    ),
                  ),
                  Container(
                    height: 25.0,
                    child: MaterialButton(
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {

                        }, child: Text('#flutter',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                        color: defaultColor,
                      ),
                    )
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                  image: NetworkImage('https://img.freepik.com/free-photo/close-up-portrait-gorgeous-young-woman_273609-40597.jpg?t=st=1678018276~exp=1678018876~hmac=6e7e62911c251b986131f79336249c052139ae33759f5276b142d40a70d48ae5'),
                  fit: BoxFit.cover,


                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.favorite_border,size: 16.0,color: Colors.red,),
                          SizedBox(width: 5.0,),
                          Text('1200',style: Theme.of(context).textTheme.caption,)
                        ],
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.message,size: 16.0,color: Colors.red,),
                          SizedBox(width: 5.0,),
                          Text('comments',style: Theme.of(context).textTheme.caption,)
                        ],
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                ),

              ],
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 10
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey,

            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage: NetworkImage('https://img.freepik.com/free-photo/close-up-portrait-gorgeous-young-woman_273609-40597.jpg?t=st=1678018276~exp=1678018876~hmac=6e7e62911c251b986131f79336249c052139ae33759f5276b142d40a70d48ae5'),

                      ),
                      SizedBox(width: 10.0,),
                      Text('write a comment....',
                        style: Theme.of(context).textTheme.caption,
                      ),

                    ],
                  ),
                  onTap: () {},
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Icon(Icons.favorite_border,size: 16.0,color: Colors.red,),
                    SizedBox(width: 5.0,),
                    Text('like',style: Theme.of(context).textTheme.caption,)
                  ],
                ),
                onTap: () {

                },
              ),

            ],
          ),
        ],
      ),
    ),
  );
}
