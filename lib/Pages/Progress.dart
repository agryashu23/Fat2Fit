import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/exercise.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  List workout =[
    {
      'title':"Chest",
      'image':'assets/images/chest.jpg',
      'subtitle':[
        {'title':"Barbell Bench Press",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Barbell Incline Bench Press",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Incline Dumbbell Fly",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Cable Crossover",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Incline Dumbbell Press",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Barbell Decline Bench Press",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Dumbbell Pullover",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Seated Machine Chest Press",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Butterfly Chest Press",'image':"assets/images/barbell-chest.jpg"},
  ]
    },
    {
      'title':"Back",
      'image':'assets/images/Back.jpg',
      'subtitle' :[
        {'title':"DeadLift",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Bent-Over Row",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Single-Arm Row",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Lat Pulldown",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Neutral Grip Pulldown",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Landmine Row",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Seated Cable Row",'image':"assets/images/barbell-chest.jpg"},
        {'title':"Pallof Press Iso Hold",'image':"assets/images/barbell-chest.jpg"},
      ]
    },
    {
      'title':'Shoulder',
      'image':'assets/images/shoulder.jpg',

      'subtitle':[
        {'title':'Overhead Press','image':"assets/images/barbell-chest.jpg"},
        {'title':'Standing Dumbbell Fly','image':"assets/images/barbell-chest.jpg"},
        {'title':'Clean and Press','image':"assets/images/barbell-chest.jpg"},
        {'title':'Machine Shoulder Press','image':"assets/images/barbell-chest.jpg"},
        {'title':'Bentover Reverse Fly','image':"assets/images/barbell-chest.jpg"},
        {'title':'Single-Arm Cable Front Raise','image':"assets/images/barbell-chest.jpg"},
        {'title':'Barbell Shoulder Press','image':"assets/images/barbell-chest.jpg"},
        {'title':'Single Hand Front Raise','image':"assets/images/barbell-chest.jpg"},
        {'title':'Dumbell Shrugs','image':"assets/images/barbell-chest.jpg"},
        {'title':'Barbell Reverse Shrugs','image':"assets/images/barbell-chest.jpg"},
      ]
    },
    {
      'title':'Biceps',
      'image':'assets/images/bicep.jpg',

      'subtitle' : [
        {'title':' Hammer Curl','image':"assets/images/barbell-chest.jpg"},
        {'title':' Regular EZ Bar Curl','image':"assets/images/barbell-chest.jpg"},
        {'title':' Dumbell Curl','image':"assets/images/barbell-chest.jpg"},
        {'title':'Reverse Curl Straight Bar','image':"assets/images/barbell-chest.jpg"},
        {'title':'Standing Cable Curl','image':"assets/images/barbell-chest.jpg"},
        {'title':'Standing Barbell Curl','image':"assets/images/barbell-chest.jpg"},
        {'title':'EZ-Bar Preacher Curl','image':"assets/images/barbell-chest.jpg"},
        {'title':'Cable Rope Supinating Curl','image':"assets/images/barbell-chest.jpg"},
    ]
    },
    {
      'title':'Triceps',
      'image':'assets/images/tricep.jpg',

      'subtitle':[
        {'title':'Close-grip Bench Press','image':"assets/images/barbell-chest.jpg"},
        {'title':'Rope Tricep Pushdown','image':"assets/images/barbell-chest.jpg"},
        {'title':'Tricep Dips','image':"assets/images/barbell-chest.jpg"},
        {'title':'Hand Tricep Dips','image':"assets/images/barbell-chest.jpg"},
        {'title':'Close-grip Bench Press','image':"assets/images/barbell-chest.jpg"},
        {'title':' Underhand Cable Pushdowns','image':"assets/images/barbell-chest.jpg"},
        {'title':'Rod Tricep Pushdown','image':"assets/images/barbell-chest.jpg"},
        {'title':' Banded Pushdowns','image':"assets/images/barbell-chest.jpg"},
      ]
    },
    {
      'title':'Legs',
      'image':'assets/images/legs.jpg',

      'subtitle':[
        {'title':'Leg curl','image':"assets/images/barbell-chest.jpg"},
        {'title':'Leg Extension','image':"assets/images/barbell-chest.jpg"},
        {'title':'Leg Press','image':"assets/images/barbell-chest.jpg"},
        {'title':'Goblet Squat','image':"assets/images/barbell-chest.jpg"},
        {'title':'Barbell Squats','image':"assets/images/barbell-chest.jpg"},
        {'title':'Dumbbell Forward Lunges','image':"assets/images/barbell-chest.jpg"},
        {'title':'Barbell Hip Thrust','image':"assets/images/barbell-chest.jpg"},
        {'title':'Standing Leg Press','image':"assets/images/barbell-chest.jpg"},
      ]
    },
    // {
    //   'title':'Cardio',
    //   'image':'assets/images/cardio.jpg',
    //
    //   'subtitle':[
    //
    //     {'title':'Leg curl','image':"assets/images/barbell-chest.jpg"},
    //     {'title':'Leg Extension','image':"assets/images/barbell-chest.jpg"},
    //     {'title':'Leg Press','image':"assets/images/barbell-chest.jpg"},
    //     {'title':'Goblet Squat','image':"assets/images/barbell-chest.jpg"},
    //     {'title':'Barbell Squats','image':"assets/images/barbell-chest.jpg"},
    //     {'title':'Barbell Hip Thrust','image':"assets/images/barbell-chest.jpg"},
    //     {'title':'Standing Leg Press','image':"assets/images/barbell-chest.jpg"},
    //   ]
    // },

  ];
  List abs =[
        {'title':'Tuck and crunch'},
        {'title':'Modified V-sit'},
        {'title':'Crunches'},
        {'title':'Hanging leg raise'},
        {'title':'Seated Russian twist'},
        {'title':'Hold Plank'},
        {'title':'Bicycle crunches'},
        {'title':'Ab Wheel Rollout'},
        {'title':'Flutter Kick'},
        {'title':'Leg Raise  '},
      // ]
    // }
  ];

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
       // appBar: AppBar(
       //    title: Text("Sets"),
       //    centerTitle: true,
       //   backgroundColor: Colors.transparent,
       //   elevation: 0,
       //   actions: [
       //     IconButton(
       //       icon: Icon(MdiIcons.heart,color: Colors.white,),
       //       onPressed: (){
       //       },
       //     ),
       //   ],
       //  ),
        backgroundColor: Colors.blue.shade700,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: workout.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=> Exercise(exercise: workout[index]['subtitle']))),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(15),

                        ),
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                        width: wSize*0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipPath(
                              clipper:SkewCut(),
                              child: Container(
                                height: hSize * 0.18,
                                width: wSize * 0.45,
                                padding: EdgeInsets.only(left: wSize*0.05),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15)
                                ),

                                alignment: Alignment.center,
                                child: Text(
                                  workout[index]['title'],style: GoogleFonts.balooBhai(
                                  fontSize: 27,color: Colors.white,fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,decorationColor: Colors.blue,
                                    decorationStyle: TextDecorationStyle.solid,decorationThickness: 2
                                ),textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: ClipPath(
                                clipper: Cutter(),
                                child: Container(
                                  height: hSize * 0.18,
                                  width: wSize * 0.47,

                                  child: Image(
                                    image:AssetImage(
                                      workout[index]['image'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
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
      );

    });
  }
}
class SkewCut extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);

    path.lineTo(size.width-20 , size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(SkewCut oldClipper) => false;
}
class Cutter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(-20, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(Cutter oldClipper) => false;
}
