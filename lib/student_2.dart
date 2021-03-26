import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'customShape.dart';


class Student2 extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student2> {

  updateAbsent2(item) {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc("bus02").collection("students").doc(item);
    //Map
    Map<String, dynamic> students = {
      "status": "absent"
    };
    documentReference.update(students).whenComplete(() {
      print("$item updated");
    });
  }

  updateOnTheBus2(item) {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc("bus02").collection("students").doc(item);
    //Map
    Map<String, dynamic> students = {
      "status": "on the bus"
    };
    documentReference.update(students).whenComplete(() {
      print("$item updated");
    });
  }

  updateAtSchool2(item) {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc("bus02").collection("students").doc(item);
    //Map
    Map<String, dynamic> students = {
      "status": "At school"
    };
    documentReference.update(students).whenComplete(() {
      print("$item updated");
    });
  }

  updateAtHome2(item) {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("buses").doc("bus02").collection("students").doc(item);
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

                Text('BUS 2', style: TextStyle(color: Colors.white, fontSize: 48,fontWeight:FontWeight.w500,),),

              ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 120)),

      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("buses").doc("bus02").collection("students").snapshots(),
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
                                              updateAbsent2(documentSnapshot["studentName"]);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("absent")),
                                        FlatButton(
                                            color: Colors.blue,
                                            onPressed: () {
                                              updateOnTheBus2(documentSnapshot["studentName"]);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Picked")),
                                        FlatButton(
                                            color: Colors.green,
                                            onPressed: () {
                                              updateAtSchool2(documentSnapshot["studentName"]);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("School")),
                                        FlatButton(
                                            color: Colors.orange,
                                            onPressed: () {
                                              updateAtHome2(documentSnapshot["studentName"]);
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