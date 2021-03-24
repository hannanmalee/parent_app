import 'package:flutter/material.dart';
import 'customShape.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}
class _StatusState extends State<Status>{
  String busNo, driverName, driverPhone, state, studentName, studentGrade, studentPhone;

  DocumentReference documentReference =
  FirebaseFirestore.instance.collection("buses").doc("bus01").collection("students").doc();

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

                Text('Students Status', style: TextStyle(color: Colors.white, fontSize: 20,fontWeight:FontWeight.w400,),),

              ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 120)),
      body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection("buses").doc("bus01").collection("students").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot =
                  snapshot.data.documents[index];
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(documentSnapshot["studentName"]),
                      ),
                      Expanded(
                        child: Text(documentSnapshot["studentGrade"]),
                      ),
                      Expanded(
                        child: Text(documentSnapshot["studentPhone"]),
                      ),

                    ],
                  );
                });
          } else {
            return Align(
              alignment: FractionalOffset.bottomCenter,
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}
