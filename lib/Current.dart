import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/Loading.dart';
import 'package:gym/ScreenPage.dart';
import 'package:gym/front.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';

class Current extends StatefulWidget {
  const Current({Key? key}) : super(key: key);

  @override
  _CurrentState createState() => _CurrentState();
}

class _CurrentState extends State<Current> {

  List card = [
    {"title":"FAT  LOSS","subtitle":"Decrease overall Body Weight by proper Exercise and Diet Management",
      "color":Colors.blue.shade300,"image":"assets/lean1.jpg","phase":"fat"},
    {"title":"MAINTENANCE","subtitle":"Maintain your Body by Developing Muscles and increasing your Personality",
      "color":Colors.yellow.shade300,"image":"assets/fit1.jpg","phase":"fit"},
    {"title":"MUSCLE  GAIN","subtitle":"Having light weight with thin muscles and"
        " want to gain weight with muscle expansion.","color":Colors.green.shade300,"image":"assets/body.jpg","phase":"slim"}
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child) {
      var hSize = MediaQuery.of(context).size.height;
      var wSize = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:Colors.grey.shade200,
      body:Center(
        child: Container(
          width: wSize*0.9,
          margin: EdgeInsets.fromLTRB(0, hSize*0.1, 0,hSize*0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
          gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  // Colors.lightBlueAccent,
                  Colors.grey,
                  Colors.black
                ]
            ),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: hSize*0.03),
                child: Text("Choose Your Phase",style: GoogleFonts.bangers(color:
                Colors.white,fontSize: wSize*0.11,fontWeight: FontWeight.bold,letterSpacing: 2.0),),
              ),
              buildCard(context,card[0]) ,
              buildCard(context,card[1]),
              buildCard(context,card[2]),

            ],
          ),
        ),
      ),
    );
  });
  }
  Widget buildCard(context, card) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      var hSize = MediaQuery.of(context).size.height;
      var wSize = MediaQuery.of(context).size.width;
      return GestureDetector(
        onTap: (){
          gym.addGoal("phase", card["phase"]);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenPage()));
        },
        child: Card(
          shadowColor: card["color"],
          elevation: 10,
          // color: card["color"],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(wSize * 0.04),
                width: wSize * 0.5,
                height: hSize * 0.22,

                decoration: BoxDecoration(
                  color: Colors.black,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15)
                        , bottomLeft: Radius.circular(15)),
                    //
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      card["title"],
                      style: GoogleFonts.zillaSlab(
                        fontSize: wSize * 0.056,
                        fontWeight: FontWeight.bold,
                        color: card["color"]
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      card["subtitle"],
                      style: TextStyle(fontSize: wSize*0.042,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                width: wSize * 0.379,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    image: DecorationImage(
                        image: AssetImage(card["image"]),
                        fit: BoxFit.cover

                    )
                ),
                height: hSize * 0.22,
                // width: 116.4,
              )
            ],
          ),
        ),
      );
    });
  }
}
