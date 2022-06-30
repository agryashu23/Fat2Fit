import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
          child: Container(
            height: 90,
        width: 90,
            child: CircularProgressIndicator(
              color: Colors.red,
              strokeWidth: 4,
            )
          ),
        ),
          Center(
            child:CircleAvatar(
              backgroundImage: AssetImage("assets/loho.png"),
              radius: 40,
              // child: Image(
              //   image: AssetImage(),
              //   width: 90,
              //   height: 90,
              // ),
            )
          ),
    ],
      ),
    );
  }
}
