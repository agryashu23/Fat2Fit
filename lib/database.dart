import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Database extends StatefulWidget {
  const Database({Key? key}) : super(key: key);

  @override
  _DatabaseState createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  final db = FirebaseDatabase.instance.ref();
  List days =[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  final String jsonfile ='hello';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            TextButton(
              onPressed: readdb,
              child:Text("OKOK"),

            ),
            Text(
              jsonfile
            )
          ]
        ),
      ),
    );
  }

  readdb() {
    db.child("days").onValue.listen((event) {
      final data = event.snapshot.value;
      days = data as List;
      print(days);

    });
  }
}
