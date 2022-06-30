import 'package:flutter/material.dart';
import 'package:gym/Pages/Plans.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';

class Weigh extends StatefulWidget {
  const Weigh({Key? key}) : super(key: key);

  @override
  State<Weigh> createState() => _WeighState();
}

class _WeighState extends State<Weigh> {
  List <bool> isSelected = [true,false];
  TextEditingController currentController = TextEditingController();
  TextEditingController goalController = TextEditingController();
  String text ='kg';

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.15,),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Text(
                    "Mention Your Current Weight:", textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightBlueAccent,
                    ),
                    width: 120,
                    height: 60,
                    child: TextField(
                      maxLength: 3,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold
                      ),
                      controller: currentController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(2),
                          counterText: text,
                          border: InputBorder.none,
                          counterStyle: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06),
              child: ToggleButtons(
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0; index < 2; index++) {
                      if (index == newIndex) {
                        isSelected[index] = true;
                      }
                      else {
                        isSelected[index] = false;
                      }
                    }
                    if(isSelected[0]==true){
                      setState(() {
                        text = "kg";
                      });
                    }
                    else{
                      setState(() {
                        text = "lb";
                      });
                    }

                  });
                },
                selectedColor: Colors.white,
                color: Colors.black,
                fillColor: Colors.green.shade200,
                renderBorder: false,
                borderRadius: BorderRadius.circular(10),
                isSelected: isSelected,
                children: [
                  Padding(
                    child: Text("kg", style: TextStyle(fontSize: 20),),
                    padding: EdgeInsets.symmetric(horizontal: 20),),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("lb", style: TextStyle(fontSize: 20),)),
                ],
               ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.08,),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Text(
                    "Mention  Your         Goal Weight:", textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightBlueAccent,
                    ),
                    width: 120,
                    height: 60,
                    child: TextField(
                      maxLength: 3,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold
                      ),
                      controller: goalController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(2),
                          counterText: text,
                          border: InputBorder.none,
                          counterStyle: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900)
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
              alignment: Alignment.center,
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () async {
                  print(currentController.text);
                  print(goalController.text);
                  if (goalController.text == '' || currentController.text=='') {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                            Text('Please Enter Your Weight')));
                  }else{
                      gym.addWeight(text, currentController.text, goalController.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Plans()));
                  }
                  print(gym.weight);

                },
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF6AA0CA),
                          Color(0xFF441CB5),
                        ],
                        // [Colors.purple, Colors.blue] can also be used as per  background color
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    constraints:
                    BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
