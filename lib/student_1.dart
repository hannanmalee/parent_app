import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'customShape.dart';
import 'package:google_fonts/google_fonts.dart';


class Student1 extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student1> {

  updateAbsent(item) {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc("bus01").collection("students").doc(item);
    //Map
    Map<String, dynamic> students = {
      "status": "absent"
    };
    documentReference.update(students).whenComplete(() {
      print("$item updated");
    });
  }

  updateOnTheBus(item) {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc("bus01").collection("students").doc(item);
    //Map
    Map<String, dynamic> students = {
      "status": "on the bus"
    };
    documentReference.update(students).whenComplete(() {
      print("$item updated");
    });
  }

  updateAtSchool(item) {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc("bus01").collection("students").doc(item);
    //Map
    Map<String, dynamic> students = {
      "status": "At school"
    };
    documentReference.update(students).whenComplete(() {
      print("$item updated");
    });
  }

  updateAtHome(item) {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc("bus01").collection("students").doc(item);
    //Map
    Map<String, dynamic> students = {
      "status": "at home"
    };
    documentReference.update(students).whenComplete(() {
      print("$item updated");
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

                Text('BUS 1', style: GoogleFonts.fahkwang(textStyle:TextStyle(color: Colors.white, fontSize: 36,fontWeight:FontWeight.w400, ),),),

              ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 120)),

      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("buses").doc("bus01").collection("students").snapshots(),
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshots.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot =
                    snapshots.data.docs[index];
                    return  Card(
                          key: Key(documentSnapshot["studentName"]),
                          elevation: 4,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            title: Text(documentSnapshot["studentName"],
                                style: TextStyle(
                                    fontWeight:FontWeight.w300
                                )),
                            subtitle: Text(documentSnapshot["status"],
                                style: TextStyle(
                                    color: Colors.deepOrange
                                )),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  key: Key(documentSnapshot["studentName"]),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8)),
                                                  title: Text("Status"),
                                                  content: Text(documentSnapshot["studentPhone"]),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                        color: Colors.red,
                                                        onPressed: () {
                                                          updateAbsent(documentSnapshot["studentName"]);
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text("absent")),
                                                    FlatButton(
                                                        color: Colors.blue,
                                                        onPressed: () {
                                                          updateOnTheBus(documentSnapshot["studentName"]);
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text("Picked")),
                                                    FlatButton(
                                                        color: Colors.green,
                                                        onPressed: () {
                                                          updateAtSchool(documentSnapshot["studentName"]);
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text("School")),
                                                    FlatButton(
                                                        color: Colors.orange,
                                                        onPressed: () {
                                                          updateAtHome(documentSnapshot["studentName"]);
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text("Droped",style: TextStyle(color: Colors.white),)
                                                    )
                                                  ],
                                                );
                                              });
                                }),
                          ),
                        );
                  });
            } else {
              return Align(
                alignment: FractionalOffset.bottomCenter,
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}