import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'Actions/workout.dart';

class Exercise extends StatefulWidget {
  const Exercise({Key? key, required this.exercise}) : super(key: key);
  final List exercise;
  @override
  _ExerciseState createState() => _ExerciseState();
}


class _ExerciseState extends State<Exercise> {

  late VideoPlayerController _controller;
  bool _visible = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/chestvid.webm");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    }




  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child) {
      var hSize = MediaQuery
          .of(context)
          .size
          .height;
      var wSize = MediaQuery
          .of(context)
          .size
          .width;
      return Scaffold(
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children:[
          AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 1000),
            child: VideoPlayer(_controller),
          ),
            Container(
              color: Colors.black.withOpacity(0.6),
            ),

              Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: widget.exercise.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder:
                                (context)=>Workout(title:widget.exercise[index]['title'],image:widget.exercise[index]['image'])));

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black45.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),

                            ),
                            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                            width: wSize*0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipPath(
                                  child: Container(
                                    height: hSize * 0.15,
                                    width: wSize * 0.45,
                                    padding: EdgeInsets.only(left: wSize*0.05),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(15)
                                    ),

                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.exercise[index]['title'],style: GoogleFonts.balooBhai(
                                      fontSize: 20,color: Colors.white70,fontWeight: FontWeight.bold,
                                    ),textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: hSize * 0.15,
                                  // width: wSize * 0.50,

                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                                    child: Image(
                                      image:AssetImage(
                                       widget.exercise[index]['image']
                                      ),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),
                        );
                      }),
                ),

              ],
            ),
      ],
          ),
        ),
      );

    });
  }

}
