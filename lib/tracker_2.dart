import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:parent_app/Map.dart';
import 'customShape.dart';

class Tracker2 extends StatefulWidget {
  @override
  _StartTrackingState createState() => _StartTrackingState();
}

class _StartTrackingState extends State<Tracker2> {


  @override
  void initState() {

    super.initState();

    storeUserLocation();

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
      body: Center(
        child: Text('launch Realtime Tracking!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 60.0,
          fontWeight: FontWeight.normal,
          wordSpacing: 10,
          color: Colors.red,
        ))

    ),

    );
  }


  storeUserLocation()
  {

    Location location = new Location();

    location.onLocationChanged.listen((LocationData currentLocation) {

      FirebaseFirestore.instance.collection('positions').doc('b02').set({
        'name' : 'school bus 2',
        'location' : GeoPoint(currentLocation.latitude, currentLocation.longitude)

      });

    });

  }
}


