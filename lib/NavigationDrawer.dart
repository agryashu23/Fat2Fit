import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/Icons.dart';
import 'package:gym/Pages/HomePage.dart';
import 'package:gym/Pages/Progress.dart';
import 'package:gym/WorkFav.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';

import 'Log.dart';
import 'Pages/Plans.dart';
import 'Pages/Utility.dart';
import 'Plans.dart';
import 'logout.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child) {
    var wSize = MediaQuery
        .of(context)
        .size
        .width;
    var hSize = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      width: wSize * 0.6,
      child: Drawer(
        child: Material(
          color: Colors.blue.shade800,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: [
              SizedBox(height: hSize * 0.06),
              buildMenuItem(
                text: FirebaseAuth.instance.currentUser!= null?"OK":"LOGIN",
                icon: Icons.account_circle,
                onClicked: () {
                  selectedItem(context, 0);
                }
              ),
              Divider(thickness: 1, color: Colors.white,),
              SizedBox(height: hSize * 0.02,),
              buildMenuItem(
                text: "Diet",
                icon: Icons.restaurant,
                  onClicked: () {
                    selectedItem(context, 1);
                  }

              ),
              SizedBox(height: hSize * 0.02,),
              buildMenuItem(
                text: "Workout",
                icon: Icons.fitness_center,
                  onClicked: () {
                    selectedItem(context,2);
                  }

              ),
              SizedBox(height: hSize * 0.02,),
              buildMenuItem(
                text: "Plans",
                icon: Custom.task_list,
                  onClicked: () {
                    selectedItem(context, 3);
                  }

              ),

              SizedBox(height: hSize * 0.02,),
              buildMenuItem(
                text: "Calendar",
                icon: Icons.calendar_today_outlined,
                  onClicked: () {
                    selectedItem(context, 4);
                  }

              ),
              SizedBox(height: hSize * 0.02,),
              buildMenuItem(
                text: "LogOut",
                icon: Icons.account_circle,
              ),

            ],
          ),
        ),

      ),
    );
  });
  }

  buildMenuItem(
      {required String text,
        required IconData icon,
        VoidCallback? onClicked,
      }) {
    return ListTile(
      leading: Icon(icon,color: Colors.white,size: 27,),
      title: Text(text,style: TextStyle(color: Colors.white,fontSize: 18),),
      hoverColor: Colors.white70,
      onTap: onClicked,

    );
  }

  selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch(i){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Plans()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Progress()));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WorkFav()));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogOut()));
        break;
    }

  }
}
