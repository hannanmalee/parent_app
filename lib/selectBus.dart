import 'package:flutter/material.dart';
import 'package:parent_app/manageBus.dart';
import 'customShape.dart';
import 'tracker_1.dart';
import 'tracker_2.dart';
import 'package:google_fonts/google_fonts.dart';



class SelectBus extends StatelessWidget {
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

                Text('Select Bus', style: GoogleFonts.fahkwang(textStyle:TextStyle(color: Colors.white, fontSize: 32,fontWeight:FontWeight.w400, ),),),

              ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 120)),
      // body: Center(
      //
      //     child: FlatButton(onPressed: (){
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => Tracker1()));
      //     },
      //       child: Text('Realtime Tracking Map'),color: Colors.black,textColor: Colors.white,),
      //
      //
      //   )
      body: SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(24.0),



            child: Column(
                children: [
                  Stack(
                      children: <Widget>[
                        Container(
                          height: 120,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Tracker1(),
                                  ));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    24)
                            ),
                            padding: EdgeInsets.all(0),
                            child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      24),
                                  gradient: LinearGradient(colors: [
                                    Color(0xffFFB157),
                                    Color(0xffFFA057),
                                    Color(0xffFFB157),
                                  ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffFFA057),
                                      blurRadius: 12,
                                      offset: Offset(0, 6),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),

                        Positioned.fill(
                          child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Image.asset(
                                    'images/pin2.png',
                                    height: 256,
                                    width: 256,
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                    flex: 2,
                                    child:
                                    //FutureBuilder(
                                    //future: getDocument(),
                                    //builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                    // if (snapshot.connectionState == ConnectionState.done) {
                                    //  return Text(snapshot.data["driverName"].toString());

                                    Column(
                                        mainAxisSize: MainAxisSize
                                            .min,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[
                                          Text("Bus 1",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize: 36,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight
                                                    .w700),
                                          ),
                                          Text(
                                            "Driver: Adam Saleah",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize: 18,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight
                                                    .w300),
                                          ),
                                          Text(
                                            "Phone: 085-9632589",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize: 18,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight
                                                    .w300),
                                          ),
                                          Text(
                                            "State: Serong",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize: 18,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight
                                                    .w300),
                                          ),
                                        ]
                                    )
                                ),


                              ]
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 10,),

                  Stack(
                      children: <Widget>[
                        Container(
                          height: 120,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Tracker2(),
                                  ));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    24)
                            ),
                            padding: EdgeInsets.all(0),
                            child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      24),
                                  gradient: LinearGradient(colors: [
                                    Color(0xffFFB157),
                                    Color(0xffFFA057),
                                    Color(0xffFFB157),
                                  ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffFFA057),
                                      blurRadius: 12,
                                      offset: Offset(0, 6),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),

                        Positioned.fill(
                          child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Image.asset(
                                    'images/pin2.png',
                                    height: 256,
                                    width: 256,
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                        mainAxisSize: MainAxisSize
                                            .min,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[
                                          Text("Bus 2",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize: 36,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight
                                                    .w700),
                                          ),
                                          Text(
                                            "Driver: Ahmad Doloh",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize: 18,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight
                                                    .w300),
                                          ),
                                          Text(
                                            "Phone: 066-9632589",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize: 18,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight
                                                    .w300),
                                          ),
                                          Text(
                                            "State: Paramitae",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize: 18,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight
                                                    .w300),
                                          ),
                                        ]
                                    )
                                ),
                              ]
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 20,),



                ]
            ),



        ),
      ),
    );
  }
}
