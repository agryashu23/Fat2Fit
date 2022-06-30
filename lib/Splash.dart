import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'Homepage.dart';
import 'Log.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _visible = true;
  @override
  void initState() {
    super.initState();
    splashHome();
  }

  splashHome() async {
    await Future.delayed(Duration(milliseconds: 1200));
    setState(() {
      _visible = false;
    });
     await Future.delayed(Duration(milliseconds: 1800));
    Navigator.pushReplacement(
        context,PageTransition(child: Homepage(), type: PageTransitionType.fade,duration: Duration(milliseconds: 1500)) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.height*0.7,
                child: AnimatedOpacity(
                  child: Image(image: AssetImage("assets/loho-remove.png")),
                  duration: Duration(milliseconds: 1000),
                  opacity: _visible?1.0:0.2,
                ),
              ),
              Container(
                child: AnimatedOpacity(
                  curve: Curves.linear,
                  child: Text("Indian Health Club",style: GoogleFonts.lobsterTwo(fontSize: 40 ,letterSpacing: 2.0,color: Colors.red.shade800),),
                  duration: Duration(milliseconds: 800),
                  opacity: _visible?0.0:1.0,
                ),
              ),



              ],
      ),
        ),
    );
  }
}
