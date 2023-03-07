import 'package:flutter/material.dart';

class Result extends StatelessWidget {
final int result;
final double age;
final bool isMale;

  const Result({
     required this.result,
    required this.age,
    required this.isMale
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Results',
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.blue[200],
        ),
        child: Padding(

          padding: const EdgeInsets.all(15.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(

                width: double.infinity,
                padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  
                  children: [
                    Icon(Icons.man_sharp ,
                    color: Colors.orange,
                      size:35,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Gender : ${isMale ? 'Male': 'Female'}',
                      style: TextStyle(

                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Row(

                    children: [
                      Icon(Icons.real_estate_agent ,
                        color: Colors.orange,
                        size:35,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Result : ${result <= 18 ? 'underweight' : '${result > 18 && result <=25 ? 'normal weight' : '${result > 25 ? 'overweight' : 'obesity'}'}'}',
                        style: TextStyle(
                          fontSize: 25,



                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(

                  children: [
                    Icon(Icons.real_estate_agent_outlined ,
                      color: Colors.orange,
                      size:35,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Age : ${age.round()}',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
