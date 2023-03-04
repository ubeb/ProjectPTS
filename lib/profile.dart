import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {

  late User _user;
  Future<void> getUserData() async {
    User user = FirebaseAuth.instance.currentUser!;
    setState((){
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(_user.email!)
          ],
        ),
      ),
    );
  }
}
