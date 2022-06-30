import 'package:flutter/material.dart';
import 'package:gym/WorkFav.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../provider.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key,required this.title,required this.image}) : super(key: key);

  final String title;
  final String image;

  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  late VideoPlayerController _controller;

  List workout =[
    {'title':'Close-grip Bench Press','video':"assets/videos/chestvid.webm",'body':'Triceps',"status": false,},
    {'title':'Rope Tricep Pushdown','video':"assets/videos/chestvid.webm",'body':'Triceps',"status": false,},
    {'title':'Tricep Dips','video':"assets/videos/chestvid.webm",'body':'Triceps',"status": false,},
    {'title':'Hand Tricep Dips','video':"assets/videos/chestvid.webm",'body':'Triceps',"status": false,},
    {'title':'Close-grip Bench Press','video':"assets/videos/chestvid.webm",'body':'Triceps',"status": false,},
    {'title':' Underhand Cable Pushdowns','video':"assets/videos/chestvid.webm",'body':'Triceps',"status": false,},
    {'title':'Rod Tricep Pushdown','video':"assets/videos/chestvid.webm",'body':'Triceps',"status": false,},
    {'title':' Banded Pushdowns','video':"assets/videos/chestvid.webm",'body':'Triceps',"status": false,},
    {'title':'Leg curl','video':"assets/videos/chestvid.webm",'body':'Legs',"status": false,},
    {'title':'Leg Extension','video':"assets/videos/chestvid.webm",'body':'Legs',"status": false,},
    {'title':'Leg Press','video':"assets/videos/chestvid.webm",'body':'Legs',"status": false,},
    {'title':'Goblet Squat','video':"assets/videos/chestvid.webm",'body':'Legs',"status": false,},
    {'title':'Barbell Squats','video':"assets/videos/chestvid.webm",'body':'Legs',"status": false,},
    {'title':'Dumbbell Forward Lunges','video':"assets/videos/chestvid.webm",'body':'Legs',"status": false,},
    {'title':'Barbell Hip Thrust','video':"assets/videos/chestvid.webm",'body':'Legs',"status": false,},
    {'title':'Standing Leg Press','video':"assets/videos/chestvid.webm",'body':'Legs',"status": false,},
    {'title':' Hammer Curl','video':"assets/videos/chestvid.webm",'body':'Biceps',"status": false,},
    {'title':' Regular EZ Bar Curl','video':"assets/videos/chestvid.webm",'body':'Biceps',"status": false,},
    {'title':' Dumbell Curl','video':"assets/videos/chestvid.webm",'body':'Biceps',"status": false,},
    {'title':'Reverse Curl Straight Bar','video':"assets/videos/chestvid.webm",'body':'Biceps',"status": false,},
    {'title':'Standing Cable Curl','video':"assets/videos/chestvid.webm",'body':'Biceps',"status": false,},
    {'title':'Standing Barbell Curl','video':"assets/videos/chestvid.webm",'body':'Biceps',"status": false,},
    {'title':'EZ-Bar Preacher Curl','video':"assets/videos/chestvid.webm",'body':'Biceps',"status": false,},
    {'title':'Cable Rope Supinating Curl','video':"assets/videos/chestvid.webm",'body':'Biceps',"status": false,},
    {'title':'Overhead Press','video':"assets/videos/chestvid.webm",'body':'Shoulder',"status": false,},
    {'title':'Standing Dumbbell Fly','video':"assets/videos/chestvid.webm",'body':'Shoulder',"status": false,},
    {'title':'Clean and Press','video':"assets/videos/chestvid.webm",'body':'Shoulder',"status": false,},
    {'title':'Machine Shoulder Press','video':"assets/videos/chestvid.webm",'body':'Shoulder',"status": false,},
    {'title':'Bentover Reverse Fly','video':"assets/videos/chestvid.webm",'body':'Shoulder',"status": false,},
    {'title':'Single-Arm Cable Front Raise','video':"assets/videos/chestvid.webm",'body':'Shoulder',"status": false,},
    {'title':'Barbell Shoulder Press','video':"assets/videos/chestvid.webm",'body':'Shoulder',"status": false,},
    {'title':'Single Hand Front Raise','video':"assets/videos/chestvid.webm",'body':'Shoulder',"status": false,},
    {'title':'Dumbell Shrugs','video':"assets/videos/chestvid.webm",'body':'Shoulder',"status": false,},
    {'title':'Barbell Reverse Shrugs','video':"assets/videos/chestvid.webm",'body':'Shoulder',"status": false,},
    {'title':"DeadLift",'video':"assets/videos/chestvid.webm",'body':'Back',"status": false,},
    {'title':"Bent-Over Row",'video':"assets/videos/chestvid.webm",'body':'Back',"status": false,},
    {'title':"Single-Arm Row",'video':"assets/videos/chestvid.webm",'body':'Back',"status": false,},
    {'title':"Lat Pulldown",'video':"assets/videos/chestvid.webm",'body':'Back',"status": false,},
    {'title':"Neutral Grip Pulldown",'video':"assets/videos/chestvid.webm",'body':'Back',"status": false,},
    {'title':"Landmine Row",'video':"assets/videos/chestvid.webm",'body':'Back',"status": false,},
    {'title':"Seated Cable Row",'video':"assets/videos/chestvid.webm",'body':'Back',"status": false,},
    {'title':"Pallof Press Iso Hold",'video':"assets/videos/chestvid.webm",'body':'Back',"status": false,},
    {'title':"Barbell Bench Press",'video':"assets/videos/chestvid.webm",'body':'Chest','muscle':'Chest, Shoulders, Triceps','desc':'Lying on a flat bench place your hands up on the bar griping it slightly wider than shoulder width apart. Place your feet on the ground in line with or behind your knees. Create an arch in your lower back and push your chest up. Lift the bar up off the rack so that the bar is above your chest. Lower the bar directly down to the chest with your elbow pointing at approximately 45 degrees. Once the bar touches the chest, pause, and then press directly up again. Continue until all reps are completed and then re-rack the barbell.',"status": false,},
    {'title':"Barbell Incline Bench Press",'video':"assets/videos/chestvid.webm",'body':'Chest','muscle':'Chest, Shoulders, Triceps','desc':'Lying on an incline bench place your hands up on the bar griping it slightly wider than shoulder width apart. Place your feet on the ground in line with or behind your knees. Create an arch in your lower back and push your chest up. Lift the bar up off the rack so that the bar is above your chest. Lower the bar directly down to the chest with your elbow pointing at approximately 45 degrees. Once the bar touches the chest, pause, and then press directly up again. Continue until all reps are completed and then re-rack the barbell.',"status": false,},
    {'title':"Incline Dumbbell Fly",'video':"assets/videos/chestvid.webm",'body':'Chest','muscle':'Chest','desc':'Lie on an incline bench holding a dumbbell in each hand with an inverted grip holding the dumbbells straight above your chest. Your palms should be facing each other. Place your feet on the ground in line with or behind your knees. Create an arch in your lower back and push your chest up. Slowly lower the dumbbells out and down to chest level in a half circle formation with a bend in your elbows. Lower the dumbbells to chest level. You should feel a stretch across your chest.',"status": false,},
    {'title':"Cable Crossover",'video':"assets/videos/chestvid.webm",'body':'Chest','muscle':'Chest','desc':'ou will need two cable machines for this exercise. Set the cable pulley above shoulder height. Grip both handles and push the cable out in front of your. Take one step forward. With your arms stretched out in front of your chest bring your arms back and bend your elbows so that you are making a large half circle with your hands. Bring your hands back to chest level then press the cables out again in front of you.',"status": false,},
    {'title':"Incline Dumbbell Press",'video':"assets/videos/chestvid.webm",'body':'Chest','muscle':'Chest, Shoulders, Triceps','desc':'Lie on a decline bench holding a dumbbell in each hand with an overhand grip holding the dumbbells straight above your chest. Place your under the leg rest. Create an arch in your lower back and push your chest up. Your palms should be facing forward. Slowly lower the dumbbells out and down to chest level with your elbow pointing at a 45 degree angle.',"status": false,},
    {'title':"Barbell Decline Bench Press",'video':"assets/videos/chestvid.webm",'body':'Chest','muscle':'Chest, Shoulders, Triceps','desc':'Lying on the bench place your hands up on the bar griping it slightly wider than'
        ' shoulder width apart. Place your legs under the leg support. Create an arch in your lower back and push your chest up. '
        'Lift the bar up off the rack so that the bar is above your chest. Lower the bar directly down to the chest with your elbow '
        'pointing at approximately 45 degrees. Once the bar touches the chest, pause, and then press directly up again, exhaling your breath.'
        ' Continue until all reps are completed and then re-rack the barbell.',"status": false,},
    {'title':"Dumbbell Pullover",'video':"assets/videos/chestvid.webm",'body':'Chest','muscle':'Chest, Shoulders, Triceps','desc':'Lying on the bench place your hands up on the bar griping it slightly wider than'
        ' shoulder width apart. Place your legs under the leg support. Create an arch in your lower back and push your chest up. '
        'Lift the bar up off the rack so that the bar is above your chest. Lower the bar directly down to the chest with your elbow '
        'pointing at approximately 45 degrees. Once the bar touches the chest, pause, and then press directly up again, exhaling your breath.'
        ' Continue until all reps are completed and then re-rack the barbell.',"status": false,},
    {'title':"Seated Machine Chest Press",'video':"assets/videos/chestvid.webm",'body':'Chest','muscle':'Chest, Shoulders, Triceps','desc':'Lying on the bench place your hands up on the bar griping it slightly wider than'
        ' shoulder width apart. Place your legs under the leg support. Create an arch in your lower back and push your chest up. '
        'Lift the bar up off the rack so that the bar is above your chest. Lower the bar directly down to the chest with your elbow '
        'pointing at approximately 45 degrees. Once the bar touches the chest, pause, and then press directly up again, exhaling your breath.'
        ' Continue until all reps are completed and then re-rack the barbell.',"status": false,},
    {'title':"Butterfly Chest Press",'video':"assets/videos/chestvid.webm",'muscle':'Chest','desc':'Lying on the bench place your hands up on the bar griping it slightly wider than'
        ' shoulder width apart. Place your legs under the leg support. Create an arch in your lower back and push your chest up. '
        'Lift the bar up off the rack so that the bar is above your chest. Lower the bar directly down to the chest with your elbow '
        'pointing at approximately 45 degrees. Once the bar touches the chest, pause, and then press directly up again, exhaling your breath.'
        ' Continue until all reps are completed and then re-rack the barbell.',"status": false,},
  ];

var video;
bool play = true;
  void initState() {
    // TODO: implement initState
    super.initState();
    workout.forEach((element) {
      if(element['title']==widget.title){
        video  = element['video'];
      }
    });
    _controller = VideoPlayerController.asset(video);
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      _controller.play();
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      var activity;
      var hSize = MediaQuery
          .of(context)
          .size
          .height;
      var wSize = MediaQuery
          .of(context)
          .size
          .width;
      workout.forEach((element) {
        if(element['title']==widget.title){
          activity = element;
        }
      });

      if(gym.work.length!=0){
        gym.work.forEach((element) {
            if (element["title"] == activity["title"]) {
              activity["status"] = true;
            }
        });
      }

      return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(activity['title']),
        ),
        body: Column(
                children: [
                  Container(
                    height: hSize * 0.28,
                    // margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                    // padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(
                          15),
                          topRight: Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Stack
                      (children: [
                        VideoPlayer(_controller),
                      Positioned.fill(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap:() {
                              _controller.value.isPlaying ? _controller.pause() : _controller.play();
                              setState(() {
                                play = !play;
                              });
                            },

                            child: play?Container()
                            : Container(
                              alignment: Alignment.center,
                              color: Colors.black26,
                              child: Icon(Icons.play_arrow, color: Colors.white, size: 80),
                            ),
                          ))
                    ],),
                  ),
                  Container(
                    height: hSize * 0.15,
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(
                          15),
                          topRight: Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: wSize * 0.29,
                              child: IconButton(
                                  iconSize: 35,
                                  icon: activity["status"]? Icon(
                                    MdiIcons.heart, color: Colors.red,) : Icon(
                                      MdiIcons.heartOutline),
                                  onPressed: () {
                                      if ( activity['status']== false) {
                                      gym.addWorkout(widget.title,widget.image);
                                      setState(() {
                                      activity['status'] = true;
                                      });
                                      } else {
                                      gym.work.removeWhere((element) =>
                                      element["title"] ==
                                      activity['title']);
                                      setState(() {
                                      activity['status'] = false;
                                      });
                                      }
                                      },
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text("Favourite", style: TextStyle(
                                    fontSize: 20),))
                          ],
                        ),
                        Container(
                            width: wSize * 0.39,
                            child: Image(
                              image: AssetImage(
                                  "assets/gifs/barbell-bench-press.gif"
                              ),
                            )
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: wSize * 0.29,

                              child: IconButton(
                                iconSize: 40,
                                icon: Icon(MdiIcons.playlistEdit),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkFav()));

                                },
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text("Add Plan", style: TextStyle(
                                    fontSize: 20),))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: wSize,
                      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                activity['title'] + " :", style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15, left: 15),
                              child: Text("BODY PART" + " :", style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 15),
                              child: Text(activity['body'],
                                  style: TextStyle(fontSize: 16)),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 15, left: 15),
                              child: Text("PRIMARY MUSCLE GROUP(s)" + " :",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 15),
                              child: Text(activity['muscle'],
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15, left: 15),
                              child: Text(
                                "DESCRIPTION" + " :", style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 15),
                              child: Text(activity['desc'],
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ],
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
