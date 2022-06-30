import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/Current.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';

import 'front.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isOn = true;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    crossFade();
  }

  crossFade() async {
    var time = const Duration(milliseconds: 3000);
    Timer.periodic(

      time,
      (timer) => setState(() {
        isOn = !isOn;
      }),
    );
    // await Future.delayed(Duration(milliseconds: 2000));
  }

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      return Scaffold(
        body: Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 1000),
              child: isOn
                  ? Container(
                key: Key("1"),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/boy1.jpg"),
                      fit: BoxFit.cover,
                      // colorFilter: ColorFilter.mode(
                      //     Colors.black.withOpacity(0.3), BlendMode.darken),
                    )),
              )
                  : Container(
                key: Key("2"),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/girl1.jpg"),
                      fit: BoxFit.fitHeight,
                      // colorFilter: ColorFilter.mode(
                      //     Colors.black.withOpacity(0.3), BlendMode.darken),
                    )),
              ),
            ),
            Column(
              children: [
                Container(
                  margin:
                  EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.08),
                  child: Text(
                    'INDIAN HEALTH CLUB',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.graduate(
                        fontSize: MediaQuery
                            .of(context)
                            .size
                            .width * 0.08,
                        color: isOn ? Colors.lightBlueAccent : Colors.red
                            .shade200,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),

                ),
                Container(
                  margin:
                  EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.04),
                  child: Text(
                    'presents',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.graduate(
                        fontSize: 25,
                        color: Colors.white54.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.04),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText(
                        'FAT2FIT',
                        textStyle: GoogleFonts.libreBaskerville(
                            fontSize: 35,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0),
                      ),
                      RotateAnimatedText(
                        'FAT2FIT',
                        textStyle: GoogleFonts.libreBaskerville(
                            fontSize: 35,
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0),
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),


                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin:
                    EdgeInsets.only(bottom: MediaQuery
                        .of(context)
                        .size
                        .height * 0.1),
                    child: Text(
                      '"Good is not enough if better is possible"',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.graduate(
                          fontSize: 35,
                          color: Colors.white54.withOpacity(0.3),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Current()),
                            (route) => false);
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                      0, 0, 0, MediaQuery
                        .of(context)
                        .size
                        .height * 0.14,),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.55,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      gradient: isOn ? LinearGradient(
                        colors: [
                          Color(0xFF6AA0CA),
                          Color(0xFF441CB5),
                        ],
                        // [Colors.purple, Colors.blue] can also be used as per  background color
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ) : LinearGradient(
                        colors: [
                          Color(0xFFECA4BD),
                          Colors.pink
                        ],
                        // [Colors.purple, Colors.blue] can also be used as per  background color
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    // padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Get Started",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.patuaOne(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: isOn ?Theme.of(context).primaryColor:Colors.pink.shade500,
                          size: 35,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
