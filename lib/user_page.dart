import 'package:flutter/material.dart';
import 'package:state_management/LoginScreen.dart';
import 'package:state_management/Theme_Helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:state_management/authentication.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}
class _UserPageState extends State<UserPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // dynamic user;
  // late String email;

  var user  = FirebaseAuth.instance.currentUser;



  // void getEmail() async {
  //   user = await _auth.currentUser;
  //   email = user.email;
  //   print(email);
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(user?.email);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Container(
                child: Image.asset("assets/SignUpLogo.png"),
              ),
            ),

            Text("Email : "),
            Text(user!.email!),
            SizedBox(height: 16.0),

            // Add widgets for verifying email
            // and, signing out the user
            ElevatedButton(
                onPressed: () async {
                  AuthenticationHelper().signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())));
                },
                child: Text('Sign out')
            )
          ],
        ),
      ),
    );
  }
}
