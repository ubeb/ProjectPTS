import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:state_management/LoginScreen.dart';

import 'Theme_Helper.dart';

class RegisterScreen extends StatelessWidget {

  Key _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //============================Logo==================================
            Container(
              width: 600,
              height: 300,
              child: SingleChildScrollView(
                child: Image.asset("assets/SignUpLogo.png"),
              ),
            ),
            //============================Logo==================================



            //=========================HeaderText===============================
            Container(
              child: Text(
                "Welcome!",
                style: TextStyle(fontSize: 35, color: Colors.black45),
              ),
            ),
            Container(
              child: Text(
                "Create your account",
                style: TextStyle(fontSize: 16, color: Colors.black45),
              ),
            ),
            //==================================================================




            //============================SignIn================================
            SizedBox(height: 30.0),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextField(
                    decoration: ThemeHelper().TextInputDecoration("Email"),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    decoration: ThemeHelper().TextInputDecoration("Username"),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    decoration: ThemeHelper().TextInputDecoration("Password"),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    decoration: ThemeHelper().ButtonBoxDecoration(context),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(50, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                        child: Text("Sign Up", style: TextStyle(color: Colors.white),),
                      ),
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                    ),

                  ),
                ],
              ),
            ),

            //============================SignIn================================





            //============================SignUp================================
            Container(
              padding: EdgeInsets.fromLTRB(10, 80, 10, 80),
              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
              // child: Text('Don\'t have an account? SignUp'),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: "Don\'t have an account?"),
                  TextSpan(
                      text: 'Sign In',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        })
                ]),
              ),
            ),
            //==================================================================
          ],
        ),
      ),
    );
  }
}
