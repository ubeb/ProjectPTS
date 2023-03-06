import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:state_management/setting_.dart';
import 'package:state_management/setting_page.dart';

import 'addpage.dart';
import 'editpage.dart';
import 'firebase_crud.dart';
import 'models/employee.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<ListPage> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readEmployee();
  //FirebaseFirestore.instance.collection('Employee').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("List"),
        // backgroundColor: Theme.of(context).primaryColor,
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.app_registration,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.pushAndRemoveUntil<dynamic>(
          //       context,
          //       MaterialPageRoute<dynamic>(
          //         builder: (BuildContext context) => AddPage(),
          //       ),
          //       (route) =>
          //           false,
          //     );
          //   },
          // )
          ElevatedButton(
              onPressed: () {
                final route = MaterialPageRoute(
                    builder: (context) => const SettingPage());
                Navigator.push(context, route);
              },
              child: Text("Setting"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView(
                children: snapshot.data!.docs.map((e) {
                  return Card(
                      child: Column(children: [
                    ListTile(
                      title: Text(e["employee_name"]),
                      subtitle: Container(
                        child: (Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Pekerjaan: " + e['pekerjaan'],
                                style: const TextStyle(fontSize: 14)),
                            Text("Contact: " + e['contact_no'],
                                style: const TextStyle(fontSize: 12)),
                          ],
                        )),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(5.0),
                            primary: const Color.fromARGB(255, 143, 133, 226),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text('Edit'),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) => EditPage(
                                  employee: Employee(
                                      uid: e.id,
                                      employeename: e["employee_name"],
                                      pekerjaan: e["pekerjaan"],
                                      contactno: e["contact_no"]),
                                ),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(5.0),
                            primary: const Color.fromARGB(255, 143, 133, 226),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text('Delete'),
                          onPressed: () async {
                            var response =
                                await FirebaseCrud.deleteEmployee(docId: e.id);
                            if (response.code != 200) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content:
                                          Text(response.message.toString()),
                                    );
                                  });
                            }
                          },
                        ),
                      ],
                    ),
                  ]));
                }).toList(),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
