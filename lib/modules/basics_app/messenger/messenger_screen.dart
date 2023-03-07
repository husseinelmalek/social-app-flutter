import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzVBaTbmV4Batv0M4YQavm01r8w1_VO_9t9w&usqp=CAU'),
            ),
            SizedBox(width: 10.0,),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
        actions: [
          IconButton(onPressed:() {},
              icon: CircleAvatar(
                radius: 15.0,
                  backgroundColor: Colors.blue,
                  child: Icon(
                      Icons.camera_alt,
                    size: 16.0,
                    color: Colors.white,
                  ),
              )
          ),
          IconButton(onPressed:() {},
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 16.0,
                  color: Colors.white,
                ),
              )
          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0,),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 15.0,),
                    Text('Search',)
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
             Container(
               height: 100.0,
               child: ListView.separated(
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index) => buildStoryItem() ,
                 separatorBuilder: (context, index) => SizedBox(
                   width: 20.0,
                 ),
                 itemCount: 10,
               ),
             ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => SizedBox(height: 10.0,),
                  itemCount: 10
              ),



            ],
          ),
        ),
      ),
    );
  }

  Widget buildStoryItem() =>  Container(
    width: 50.0,
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzVBaTbmV4Batv0M4YQavm01r8w1_VO_9t9w&usqp=CAU',
              ),
            ),
            CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(


                radius: 7.0,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          height:5.0 ,
        ),
        Text(
          'hussein said mohamed',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,

        ),
      ],
    ),
  );
  Widget buildChatItem() =>  Row(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzVBaTbmV4Batv0M4YQavm01r8w1_VO_9t9w&usqp=CAU',
            ),
          ),
          CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(


              radius: 7.0,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      SizedBox(width: 15.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'hussein said',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'please send the moneyhhdhujsdhkjhdskjhkjsdhkkjhkdsflkdksjhdkjhjhkjshkjdhfjkdhfkjdshkjhfkjdh',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                  '12:30 pm',
                ),
              ],
            ),
          ],
        ),
      ),

    ],

  );

}
