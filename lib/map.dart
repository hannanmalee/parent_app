import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'customShape.dart';


class Map extends StatefulWidget {
  @override
  MyMapPageState createState() => MyMapPageState();
}

class MyMapPageState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [];

  BitmapDescriptor pinLocationIcon;
  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'images/pin4.png');
  }

  @override
  void initState() {

    super.initState();
    setCustomMapPin();

    FirebaseFirestore.instance.collection('positions').snapshots().listen((event){

      event.docChanges.forEach((change){

        setState(() {

          markers.add(

              Marker(
                  icon: pinLocationIcon,
                  markerId: MarkerId(change.doc.id),
                  infoWindow: InfoWindow(
                      title: change.doc.data()['name'].toString()
                  ),
                  position: LatLng(change.doc.data()['location'].latitude,change.doc.data()['location'].longitude)

              )

          );

        });

      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: ClipPath(
            // clipper: CustomShape(),
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

                Text('Realtime Map', style: TextStyle(color: Colors.white, fontSize: 20,fontWeight:FontWeight.w400,),),

              ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 5)),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(6.450586,101.450527),
          zoom: 10,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers:markers.toSet(),
      ),
    );
  }
}

