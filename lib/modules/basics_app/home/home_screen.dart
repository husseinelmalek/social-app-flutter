import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
            Icons.menu
        ),
        title: Text('hussein'),
        actions: [
          IconButton(onPressed: () {
            print('hello notifications');
          },
            icon: Icon(Icons.notifications,

          ),),
          IconButton(
            icon: Icon(Icons.access_alarm,
            ),
            onPressed: () {
              print ('the alarm is ready');
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                      image:NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzVBaTbmV4Batv0M4YQavm01r8w1_VO_9t9w&usqp=CAU',
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),

                    color: Colors.orange.withOpacity(0.7),
                    width: 200.0,
                    child: Text(
                        'the sky ',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,

                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
