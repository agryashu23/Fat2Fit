import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';

import 'Homepage.dart';
import 'Loading.dart';
import 'Log.dart';
import 'Pad.dart';
import 'ScreenPage.dart';


class OTP extends StatefulWidget {
  const OTP(
      {Key? key,
        required this.value,
        required this.control,
        required this.countryCode})
      : super(key: key);
  final String value;
  final String control;
  final String countryCode;



  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  int ?_forceResendingToken;

  String code = "";

  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
    try {
      setState(() {
        // loading = true;
      });
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {
        setState(() {
          // loading = false;
        });

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ScreenPage()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        // loading =false;
      });
      print(e.message);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Enter Correct OTP')));
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget yesButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => Login()), (
            route) => false);
      },
    );
    Widget noButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text('Want to change Mobile Number?'),
      actions: [
        yesButton,
        noButton
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      return gym.loading ? Loading() : Scaffold(
        body: Stack(
          children: [
            ShaderMask(
              shaderCallback: (bounds) =>
                  LinearGradient(
                    colors: [Colors.black26, Colors.black38],
                  ).createShader(bounds),
              blendMode: BlendMode.darken,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/dumb.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.darken),
                    )),
              ),
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Phone Verification",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF818181).withOpacity(0.5),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.15,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Code is sent to ",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white70
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2),
                              child: GestureDetector(
                                onTap: () {
                                  showAlertDialog(context);
                                },
                                child: Text(
                                  widget.countryCode + widget.control,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.lightBlue.shade200,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.05,),

                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              buildCodeNumberBox(
                                  code.length > 0 ? code.substring(0, 1) : ""),
                              buildCodeNumberBox(
                                  code.length > 1 ? code.substring(1, 2) : ""),
                              buildCodeNumberBox(
                                  code.length > 2 ? code.substring(2, 3) : ""),
                              buildCodeNumberBox(
                                  code.length > 3 ? code.substring(3, 4) : ""),
                              buildCodeNumberBox(
                                  code.length > 4 ? code.substring(4, 5) : ""),
                              buildCodeNumberBox(
                                  code.length > 5 ? code.substring(5, 6) : ""),

                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Text(
                                "Didn't recieve code? ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF818181),
                                ),
                              ),

                              SizedBox(
                                width: 5,
                              ),

                              GestureDetector(
                                onTap: () {
                                  FirebaseAuth.instance.verifyPhoneNumber(
                                    phoneNumber:
                                    '${widget.countryCode}${widget.control
                                        .trim()}',
                                    forceResendingToken: _forceResendingToken,
                                    verificationCompleted:
                                        (PhoneAuthCredential credential) {},
                                    verificationFailed:
                                        (FirebaseAuthException e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          SnackBar(
                                              content: Text('Error Occurred')));
                                    },
                                    codeSent: (String verificationId,
                                        [int? forceResendingToken]) {
                                      _forceResendingToken =
                                          forceResendingToken;
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              OTP(
                                                  value: verificationId,
                                                  control: widget.control,
                                                  countryCode: widget
                                                      .countryCode),
                                        ),
                                      );
                                    },
                                    codeAutoRetrievalTimeout:
                                        (String verificationId) {},
                                  );
                                },
                                child: Text(
                                  "Request again",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.indigo.shade200
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                NumericPad(
                  onNumberSelected: (value) {
                    print(code.length);
                    setState(() {
                      if (value != -1) {
                        if (code.length < 7) {
                          code = code + value.toString();
                          if (code.length == 6) {
                            AuthCredential phoneAuthCredential =
                            PhoneAuthProvider.credential(
                                verificationId: widget.value,
                                smsCode: code.trim());
                            signInWithPhoneAuthCred(phoneAuthCredential);
                          }
                        }
                      }
                      else {
                        code = code.substring(0, code.length - 1);
                      }
                      print(code);
                    });
                  },
                ),

              ],
            ),
          ],
        ),
      );
    });
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery
          .of(context)
          .size
          .width * 0.01),
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.13,
        height: MediaQuery
            .of(context)
            .size
            .width * 0.13,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75)
              )
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
