import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';
import 'Log.dart';
import 'OTP.dart';
import 'loading.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  final googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, cart, child)
    {
      return cart.loading?Loading():Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              logOut();
            },
            child: Text(
                "Logout"
            ),

          ),
        ),
      );
    });
  }
  Future logOut() async{
    await FirebaseAuth.instance.signOut().then((value) {
      setState(() {
        googleSignIn.disconnect();
      });
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false);
    });


  }
}
