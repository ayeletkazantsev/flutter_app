import 'package:flutter/material.dart';
//services
import 'package:google_sign_in/google_sign_in.dart';
//other pages
import 'auth.dart';

void main() => runApp(TechLyft());

class TechLyft extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechLyft',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/graphics/logo.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        height: 70.0,
                        child: Text("Sign in with:",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.grey)))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _facebookSignInButon()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _googleSignInButton()
                  ],
                )
              ],
            )));
  }
}

Widget _facebookSignInButon()
{
  return Expanded(
        child: Padding(
          padding:
          const EdgeInsets.only(
              left: 20.0, right: 10.0, top: 10.0),
          child: Container(
            alignment: Alignment.center,
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                color: Color(0xFF4364A1),
                borderRadius: BorderRadius.circular(10.0)),
            child: Text("Facebook",
                style:
                TextStyle(fontSize: 20.0, color: Colors.white)),
          ),
        ),
      );
}

Widget _googleSignInButton()
{
  return Expanded(
        child: Padding(
          padding:
          const EdgeInsets.only(
              left: 20.0, right: 10.0, top: 10.0),
          child: GestureDetector(
            onTap: () {
                authService.signInWithGoogle();
            },
            child: Container(
              alignment: Alignment.center,
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  color: Color(0xFFDF513B),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text("Google",
                  style:
                  TextStyle(fontSize: 20.0, color: Colors.white)),
            ),
          ),
        ),
      );
}

