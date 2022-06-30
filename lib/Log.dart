import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gym/Loading.dart';
import 'package:gym/OTP.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';

import 'ScreenPage.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneNumber = TextEditingController();
  var countryCode;
  GoogleSignInAccount? _user;
  String verificationId = "";
  GoogleSignInAccount get user => _user!;

  Future googleSign(gym) async{
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if(googleUser == null) return;
    _user = googleUser;
    final  googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    gym.loader(false);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child) {
    return gym.loading ? Loading() : Scaffold(
        resizeToAvoidBottomInset: false,
      body:
      StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot)
    {
      if (snapshot.connectionState == ConnectionState.waiting) {
        gym.loader(false);
      }
      else if (snapshot.hasData) {
        gym.loader(false);
        return ScreenPage();

      }
      else if (snapshot.hasError) {
        gym.loader(false);
        ScaffoldMessenger.of(context)
            .showSnackBar(
            SnackBar(
                content: Text(
                    '')));
      }
      return
        Stack(
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
                      image: AssetImage("assets/cover.jpeg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.darken),
                    )),
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.45),
                GestureDetector(
                  onTap: () async {
                    gym.loader(true);
                    googleSign(gym);
                  },
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.55,
                    padding: EdgeInsets.all(8),
                    // margin: EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: Colors.black54),
                    ),
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            "assets/google.jpg", width: 30, height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 20.0, top: 10, bottom: 10),
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                          height: 36,
                        )),
                  ),
                  Text("OR",
                    style: TextStyle(color: Colors.white54, fontSize: 17),),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 10.0, top: 10, bottom: 10),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                ]),


                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.shade700, width: 0.5),
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0x00282727),
                  ),
                  child: AutofillGroup(
                    child: TextField(
                      autofocus: false,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      controller: phoneNumber,
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'))
                      ],
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                        counterText: "",
                        suffixIcon: IconButton(icon: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.blueAccent, size: 30,),
                            onPressed: () async {
                              if (phoneNumber.text.length == 10) {
                                gym.loader(true);
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber:
                                  '$countryCode${phoneNumber.text
                                      .trim()}',
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) {
                                    gym.loader(false);
                                  },
                                  verificationFailed:
                                      (FirebaseAuthException e) {
                                    gym.loader(false);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Enter Correct Mobile Number')));
                                  },
                                  codeSent: (String verificationId,
                                      int? resendToken) {
                                    gym.loader(false);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OTP(
                                                value: verificationId,
                                                control: phoneNumber
                                                    .text,
                                                countryCode: countryCode),
                                      ),
                                    );
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {

                                  },
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Please Enter Correct Mobile Number')));
                              }
                            }
                        ),
                        hintStyle: TextStyle(
                            color: Colors.white54, fontSize: 17),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 18),

                        prefixIcon: CountryCodePicker(
                          textStyle: TextStyle(
                              color: Colors.white, fontSize: 19),
                          // enabled: false,
                          onChanged: (c) {
                            setState(() {
                              countryCode = c.toString();
                            });
                          },
                          initialSelection: '+91',
                          // showCountryOnly: true,
                          // showOnlyCountryWhenClosed: true,
                          favorite: ['+91', 'US'],
                          onInit: (c) {
                            countryCode = c.toString();
                            // print(c);
                          },
                        ),
                        // Padding(
                        //     padding:EdgeInsets.symmetric(vertical: 14,horizontal: 20),
                        //     child: Text("(+91)",style: TextStyle(color: Colors.white,fontSize: 17)))
                      ),
                      keyboardType: TextInputType.number,
                      autofillHints: [AutofillHints.telephoneNumberNational],
                    ),
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: AnimatedOpacity(opacity: 0.1, duration: Duration(
                      milliseconds: 500), child: Text(
                      "Indian Health Club", style: GoogleFonts.patuaOne(
                      fontSize: 40, color: Colors.white54)),
                  ),
                ),
              ],
            )

          ],
        );
    }
      ),
    );
    });
  }

}
