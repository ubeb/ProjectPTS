import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:state_management/authentication.dart';
import 'package:state_management/user_page.dart';
import 'RegisterScreen.dart';
import 'package:state_management/home.dart';

import 'Theme_Helper.dart';

class LoginScreen extends StatelessWidget {
  Key _formkey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pass = TextEditingController();


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
                "Welcome Back!",
                style: TextStyle(fontSize: 35, color: Colors.black45),
              ),
            ),
            Container(
              child: Text(
                "Login your account",
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
                    controller: _email,
                    decoration: ThemeHelper().TextInputDecoration("Email"),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    controller: _pass,
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
                        child: Text("Sign In", style: TextStyle(color: Colors.white),),
                      ),
                      onPressed: () {
                        AuthenticationHelper()
                            .signIn(email: _email.text, password: _pass.text)
                            .then((result) => {
                          if (result == null) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => Home())
                            )
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(result!, style: TextStyle(fontSize: 16),)
                            ))
                          }
                        });
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
              margin: EdgeInsets.fromLTRB(10, 80, 10, 80),
              // child: Text('Don\'t have an account? SignUp'),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: "Don\'t have an account?"),
                  TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
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
