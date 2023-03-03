// import 'package:state/main.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class editpage extends StatefulWidget {
//   const editpage({Key? key}) : super(key: key);

//   @override
//   State editpage> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State {   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
// editpage> {
//   final controllerName = TextEditingController();
//   final controllerAge = TextEditingController();
//   final controllerDate = TextEditingController();

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text('Add User'),
//         ),
//         body: ListView(
//           padding: EdgeInsets.all(16),
//           children: <Widget>[
//             TextField(
//               controller: controllerName,
//               decoration: decoration('Name'),
//             ),
//             const SizedBox(height: 24),
//             TextField(
//               controller: controllerAge,
//               decoration: decoration('Age'),
//               keyboardAppearance: Brightness.dark,
//             ),
            
//             const SizedBox(height: 24),
            
//             // DateTimeField(
//             //   controller: controllerDate,
//             //   decoration: decoration('Date'),
//             //   format: DateFormat('yyyy-MM-dd'),
//             //   onShowPicker: (context, currentValue) =>
//             //     showDatePicker(
//             //       context: context,
//             //       firstDate: DateTime(1900),
//             //       initialDate: currentValue ?? DateTime.now(),
//             //       lastDate: DateTime(2100),
//             //     ),
//             // ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               child: Text('Create'),
//               onPressed: () {
//                 final user = User(
//                   name: controllerName.text,
//                   age: int.parse(controllerAge.text),
//                   // birthday: DateTime.parse(controllerDate.text),
//                 );
//                 createUser(user);

//                 Navigator.pop(context, );
//               },
//             ),
//           ],
//         ),
//       );

//   InputDecoration decoration(String label) => InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//       );

//   Future createUser(User user) async {
//     final docUser = FirebaseFirestore.instance.collection('users').doc();
//     user.id = docUser.id;

//     final json = user.toJson();
//     await docUser.set(json);
//   }
// }
