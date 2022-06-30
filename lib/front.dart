import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  _GoalPageState createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  List card = [
    {"title":"FAT \n LOSS","subtitle":"Loose Weight With Proper Exercise and Diet Management",
      "color":Colors.blue.shade300,"image":"assets/slimfit.jpg","phase":"fat"},
    {"title":"BULK \n BODY","subtitle":"Bulk Muscle Gain with Heavy lifts and diet Management",
      "color":Colors.yellow.shade300,"image":"assets/fit2.png","phase":"fit"},
    {"title":"MAINTAIN / BODY","subtitle":"Having light weight with thin muscles and"
        " want to gain weight with muscle expansion.","color":Colors.lightGreenAccent,"image":"assets/skinny2.png","phase":"slim"}
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      var hSize = MediaQuery.of(context).size.height;
      var wSize = MediaQuery.of(context).size.width;
      return WillPopScope(
        onWillPop: () {
          gym.goal.clear();
          return new Future(() => true);
        },
        child: Scaffold(
          appBar: AppBar(
            leading:  BackButton(
              color: Colors.black54,
            onPressed: (){
              gym.goal.clear();

            }
    ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Container(
              width: wSize*0.95,
              margin: EdgeInsets.fromLTRB(0, hSize*0.08, 0,hSize*0.02),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: hSize*0.02),
                  padding: EdgeInsets.all(10),
                  color: Colors.black,
                  child: Text("Choose Your Goal",style: GoogleFonts.bangers(color:
                  Colors.white,fontSize: wSize*0.11,fontWeight: FontWeight.bold,letterSpacing: 2.0),),
                ),
                  Row(
                  children: [
                    buildCard(context,card[0]),
            ],
                )
    ],
            ),
          ),

        ),
      ),
      );
    });
  }
  Widget buildCard(context,card) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
    var hSize = MediaQuery.of(context).size.height;
    var wSize = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        gym.addGoal("goal", card["title"]);

        print(gym.goal);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>GoalPage()));
      },
      child: Card(
        color: Colors.black,
        shadowColor: Colors.grey,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: Text("FAT \nLOSS",style: GoogleFonts.mateSc(color:
              Colors.blue.shade300,fontSize: wSize*0.07,fontWeight: FontWeight.bold,letterSpacing: 3.0),),
            ),
            Container(
              width: wSize * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("assets/lean1.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              height: hSize * 0.257,
            ),
            Container(
              width: wSize*0.44,
              child: Text(card["subtitle"],
                style: TextStyle(color: Colors.blue.shade300,fontSize: 18,letterSpacing: 1.6),),
            )
          ],
        ),
      ),
    );
    });
  }
}
