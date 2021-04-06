import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'customShape.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ManageStudent extends StatefulWidget {
  @override
  _ManageStudentState createState() => _ManageStudentState();
}
class _ManageStudentState extends State<ManageStudent>{
  String busNo, driverName, driverPhone, state, studentName, studentGrade, studentPhone, status;

  getBusNo(busNo) {
    this.busNo = busNo;
  }
  getDriverName(driverName){
    this.driverName = driverName;
  }
  getDriverPhone(driverPhone){
    this.driverPhone = driverPhone;
  }
  getState(state){
    this.state = state;
  }
  getStudentName(studentName){
    this.studentName = studentName;
  }
  getStudentGrade(studentGrade){
    this.studentGrade = studentGrade;
  }
  getStudentPhone(studentPhone){
    this.studentPhone = studentPhone;
  }

  createData() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc(busNo).collection("students").doc(studentName);

    // create Map
    Map<String, dynamic> students = {
      "busNo": busNo,
      "studentName": studentName,
      "studentGrade": studentGrade,
      "studentPhone": studentPhone,
      "status": "at home"
    };

    documentReference.set(students).whenComplete(() {
      print("$studentName created");
      showToastMessage("$studentName created");

    });
  }

  readData() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc(busNo).collection("students").doc(studentName);


    documentReference.get().then((datasnapshot) {
      // print(datasnapshot.data()["busNo"]);
      // print(datasnapshot.data()["studentName"]);
      // print(datasnapshot.data()["studentGrade"]);
      // print(datasnapshot.data()["studentPhone"]);
      showToastMessage(datasnapshot.data()["busNo"]);
      showToastMessage(datasnapshot.data()["studentName"]);
      showToastMessage(datasnapshot.data()["studentGrade"]);
      showToastMessage(datasnapshot.data()["studentPhone"]);
    });
  }

  updateData() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc(busNo).collection("students").doc(studentName);

    // create Map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentGrade": studentGrade,
      "studentPhone": studentPhone,
    };

    documentReference.set(students).whenComplete(() {
      print("$studentName updated");
      showToastMessage("$studentName updated");
    });
  }

  deleteData() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc(busNo).collection("students").doc(studentName);

    documentReference.delete().whenComplete(() {
      print("$studentName deleted");
      showToastMessage("$studentName deleted");
    });
  }

  createDataBus() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc(busNo);

    // create Map
    Map<String, dynamic> buses = {
      "busNo": busNo,
      "driverName": driverName,
      "driverPhone": driverPhone,
      "state": state,
    };

    documentReference.set(buses).whenComplete(() {
      print("$busNo created");
      showToastMessage("$busNo created");

    });
  }
  readDataBus() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc(busNo);


    documentReference.get().then((datasnapshot) {
      // print(datasnapshot.data()["busNo"]);
      // print(datasnapshot.data()["driverName"]);
      // print(datasnapshot.data()["driverPhone"]);
      // print(datasnapshot.data()["state"]);
      showToastMessage(datasnapshot.data()["busNo"]);
      showToastMessage(datasnapshot.data()["driverName"]);
      showToastMessage(datasnapshot.data()["driverPhone"]);
      showToastMessage(datasnapshot.data()["state"]);
    });
  }

  updateDataBus() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc(busNo);

    // create Map
    Map<String, dynamic> buses = {
      "busNo": busNo,
      "driverName": driverName,
      "driverPhone": driverPhone,
      "state": state,
    };

    documentReference.set(buses).whenComplete(() {
      print("$busNo updated");
      showToastMessage("$busNo updated");
    });
  }

  deleteDataBus() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc(busNo);

    documentReference.delete().whenComplete(() {
      print("$busNo deleted");
      showToastMessage("$busNo deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: ClipPath(
            clipper: CustomShape(),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xffE67332),
                        Color(0xffFE5A3F)

                      ]
                  )
              ),
              child: Column( mainAxisAlignment: MainAxisAlignment.center ,children: <Widget>[

                Text('Manage Students', style: GoogleFonts.fahkwang(textStyle:TextStyle(color: Colors.white, fontSize: 32,fontWeight:FontWeight.w400, ),),),

              ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 120)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
                child: Text(
                  "Students",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "*Bus No.",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String busNo) {
                  getBusNo(busNo);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "*Student Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String name) {
                  getStudentName(name);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Grade",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String grade) {
                  getStudentGrade(grade);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Phone",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String phone) {
                  getStudentPhone(phone);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Create"),
                  textColor: Colors.white,
                  onPressed: () {
                    createData();
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Read"),
                  textColor: Colors.white,
                  onPressed: () {
                    readData();
                  },
                ),
                RaisedButton(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Update"),
                  textColor: Colors.white,
                  onPressed: () {
                    updateData();
                  },
                ),
                RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Delete"),
                  textColor: Colors.white,
                  onPressed: () {
                    deleteData();
                  },
                )
              ],
            ),

          ],
        ),
      ),


    );
  }
  void showToastMessage(String message){
    Fluttertoast.showToast(
        msg: message, //message to show toast
        toastLength: Toast.LENGTH_SHORT, //duration for message to show
        gravity: ToastGravity.CENTER, //where you want to show, top, bottom
        timeInSecForIosWeb: 1, //for iOS only
        //backgroundColor: Colors.red, //background Color for message
        textColor: Colors.white, //message text color
        fontSize: 12.0 //message font size
    );
  }
}
