import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:parent_app/student_1.dart';
import 'driver_home.dart';
import 'customShape.dart';

class Tracker1 extends StatefulWidget {
  @override
  _StartTrackingState createState() => _StartTrackingState();
}

class _StartTrackingState extends State<Tracker1> {


  @override
  void initState() {

    super.initState();

    storeUserLocation();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //     child: ClipPath(
      //       clipper: CustomShape(),
      //       child: Container(
      //         decoration: BoxDecoration(
      //             gradient: LinearGradient(
      //                 begin: Alignment.topCenter,
      //                 end: Alignment.bottomCenter,
      //                 colors: <Color>[
      //                   Color(0xffE67332),
      //                   Color(0xffFE5A3F)
      //                 ]
      //             )
      //         ),
      //         child: Column( mainAxisAlignment: MainAxisAlignment.center ,children: <Widget>[
      //
      //           Text('BUS 1', style: TextStyle(color: Colors.deepOrange, fontSize: 48,fontWeight:FontWeight.w500,),),
      //
      //         ],),),
      //     ),
      //     preferredSize: Size.fromHeight(kToolbarHeight + 120)),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: SizedBox(
                  width: 240,
                  height: 240,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.check_circle_rounded, size: 40,),
                    label: Text('GO Checklist', style: TextStyle(fontSize: 25),),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Student1(),
                          ));
                    },
                  ),
                ),
              ),

              // Text('launch Realtime Tracking!',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 30.0,
              //       fontWeight: FontWeight.normal,
              //       wordSpacing: 5,
              //       color: Colors.red,
              //     )),
          ]
        ),
      ),

    );
  }


  storeUserLocation()
  {

    Location location = new Location();

    location.onLocationChanged.listen((LocationData currentLocation) {

      FirebaseFirestore.instance.collection('positions').doc('b01').set({
        'name' : 'school bus 1',
        'location' : GeoPoint(currentLocation.latitude, currentLocation.longitude)

      });

    });

  }
}


