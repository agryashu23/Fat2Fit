import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';

class Plans extends StatefulWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  final questions = [
    {
      'title': 'MORNING',
      'subtitle': 'Just After Wake Up ',
      'options': [
        {'text': 'Boiled Water', 'score': "assets/water.jpg"},
      ],
    },
    {
      'title': 'BREAKFAST',
      'subtitle': 'Have Atleast three of them for heavy diet ',

      'options': [
        {'text': 'Milk ', 'score': "assets/milk.jpg"},
        {'text': 'DryFruit ', 'score': "assets/dryfruit.jpg"},
        {'text': 'Peanut Butter ', 'score': "assets/peanut.jpg"},
        {'text': 'Banana ', 'score': "assets/banana.jpg"},
        {'text': 'Eggs ', 'score': "assets/eggs.jpg"},
      ],
    },
    {
      'title': 'BEFORE WORKOUT',
      'subtitle': 'High Carb Meal ,1 Hour before Workout ',

      'options': [
        {'text': 'Boiled Potato', 'score': "assets/potato.jpg"},
        {'text': 'Banana', 'score': "assets/banana.jpg"},
      ],
    },
    {
      'title': 'AFTER WORKOUT ',
      'subtitle': 'Protein Meal after 15-20 mins of Workout ',

      'options': [
        {'text': 'Paneer', 'score': "assets/paneer.jpg"},
        {'text': 'Boiled Chicken ', 'score': "assets/chicken.jpg"},
        {'text': 'Eggs ', 'score': "assets/eggs.jpg"},
        {'text': 'Sprout', 'score': "assets/sprout.jpg"},
      ],
    },
    {
      'title': 'LUNCH',
      'subtitle': 'Have Atleast Two of them ',

      'options': [
        {'text': 'Salad', 'score': "assets/salad.jpg",},
        {'text': 'Curd', 'score': "assets/curd.jpg",},
        {'text': 'Chicken', 'score': "assets/chicken.jpg",},
        {'text': 'Vegetable & Chapati', 'score': "assets/chapati.jpg",},
      ],
    },
    {
      'title': 'DINNER',
      'subtitle': 'Have Atleast Two of them with Light diet ',

      'options': [
        {'text': 'Salad', 'score':"assets/salad.jpg"},
        {'text': 'Rice', 'score':"assets/rice.jpg"},
        {'text': 'Oats', 'score': "assets/oats.jpg"},
        {'text': 'Vegetable & Chapati', 'score': "assets/chapati.jpg",},

      ],
    },

  ];
  List newItems =[];
  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child) {
      var hSize = MediaQuery.of(context).size.height;
      var wSize = MediaQuery.of(context).size.width;

      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Weight Gain"),
          backgroundColor: Colors.grey.withOpacity(0.5),
          // foregroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            ShaderMask(
            shaderCallback: (bounds) =>
        LinearGradient(
        colors: [Colors.black26, Colors.black38],
              ).createShader(bounds),
              blendMode: BlendMode.darken,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/diet.jpg"),
                  fit: BoxFit.fitHeight,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
                )),
              ),
            ),
            ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: questions.length,
          itemBuilder: (BuildContext context, int index) {
            var a = (questions[index]['options']
            as List<Map<String, Object>>)
                .map((answer) {
              return answer;
            }).toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: hSize * 0.03),
                Container(
                    margin: EdgeInsets.only(bottom: 5),
                    alignment: Alignment.center,
                    child: Text(questions[index]['title'].toString(),
                      style: TextStyle(fontSize: 24,
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          letterSpacing: 1.5),)),
                Container(
                    margin: EdgeInsets.only(bottom:10),
                    alignment: Alignment.center,
                    child: Text(questions[index]['subtitle'].toString(),
                      style: TextStyle(fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),)),
                Container(
                  height: hSize * 0.18,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: a.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Card(
                          color: Colors.transparent,
                          // shadowColor: Colors.white.withOpacity(0.4),
                          elevation: 5,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: hSize * 0.1,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage( image: AssetImage( a[index]['score'].toString(),),
                                        fit: BoxFit.cover
                                    )
                                ),

                              ),
                              Container(
                                width: 100,
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  a[index]['text'].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.bold,color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      );
    });
  }

}
