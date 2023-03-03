import 'package:flutter/material.dart';
import 'package:state/listpage.dart';

import '../models/employee.dart';
import 'firebase_crud.dart';

class EditPage extends StatefulWidget {
final Employee? employee;
 EditPage({this.employee});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditPage();
  }
}

class _EditPage extends State<EditPage> {
  final _employee_name = TextEditingController();
  final _employee_pekerjaan = TextEditingController();
  final _employee_contact = TextEditingController();
  final _docid = TextEditingController();

   
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override
  void initState() {
    _docid.value = TextEditingValue(text: widget.employee!.uid.toString());
    _employee_name.value = TextEditingValue(text: widget.employee!.employeename.toString());
    _employee_pekerjaan.value = TextEditingValue(text: widget.employee!.pekerjaan.toString());
    _employee_contact.value = TextEditingValue(text: widget.employee!.contactno.toString());
    
  }

  @override
  Widget build(BuildContext context) {
        // final imgField = TextFormField(
    //     controller: _employee_img,
    //     autofocus: false,
    //     validator: (value) {
    //       if (value == null || value.trim().isEmpty) {
    //         return 'This field is required';
    //       }
    //     },
    //     decoration: InputDecoration(
    //       icon: IconButton(
    //           onPressed: () async {
    //             ImagePicker imagePicker = ImagePicker();
    //             XFile? file =
    //                 await imagePicker.pickImage(source: ImageSource.camera);
    //             print('${file?.path}');

    //             if (file == null) return;

    //             String uniqueFileName =
    //                 DateTime.now().millisecondsSinceEpoch.toString();

    //             Reference referenceRoot = FirebaseStorage.instance.ref();
    //             Reference referenceDiriImages = referenceRoot.child('images');
    //             Reference referenceImageToUpload =
    //                 referenceDiriImages.child(uniqueFileName);

    //             try {

    //               await referenceImageToUpload.putFile(File(file.path));
    //               imageUrl=await referenceImageToUpload.getDownloadURL();
    //             } catch (error) {}
    //           },
    //           icon: Icon(Icons.camera_alt)),
    //     ));


    // final DocIDField = TextField(
    //     controller: _docid,
    //     readOnly: true,
    //     autofocus: false,
    //     // decoration: InputDecoration(
    //     //     contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //     //     hintText: "Name",
    //     //     border:
    //     //         OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                
                
    // );

         

    final nameField = TextFormField(
        controller: _employee_name,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final pekerjaanField = TextFormField(
        controller: _employee_pekerjaan,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Pekerjaan",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final contactField = TextFormField(
        controller: _employee_contact,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Contact Number",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ListPage(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
        },
        child: const Text('View List of Employee'));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.updateEmployee(
                name: _employee_name.text,
                pekerjaan: _employee_pekerjaan.text,
                contactno: _employee_contact.text,
                docId: _docid.text);
            if (response.code != 200) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            }
          }
        },
        child: Text(
          "Update",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Update'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // DocIDField,
                  // const SizedBox(height: 25.0),
                  nameField,
                  const SizedBox(height: 25.0),
                  pekerjaanField,
                  const SizedBox(height: 35.0),
                  contactField,
                  viewListbutton,
                  const SizedBox(height: 45.0),
                  SaveButon,
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}