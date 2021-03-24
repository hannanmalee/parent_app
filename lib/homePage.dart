import 'package:flutter/material.dart';
import 'package:parent_app/map.dart';
import 'package:parent_app/notifications.dart';
import 'package:parent_app/setting.dart';
import 'package:parent_app/status.dart';
import 'dart:ui' as ui;
import 'customShape.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

                  Text('Homepage', style: TextStyle(color: Colors.white, fontSize: 20,fontWeight:FontWeight.w400,),),
              ],),),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight + 120)),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(

            child: Column(
              children: [
                Stack(
                    children: <Widget>[
                      Container(
                        height: 150,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Map(),
                                ));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)
                          ),
                          padding: EdgeInsets.all(0),
                          child: Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(colors: [
                                  Color(0xffFFB157), Color(0xffFFA057)
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
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: CustomPaint(
                          size: Size(100, 150),
                          painter: CustomCardShapePainter(24,
                              Color(0xffFFB157), Color(0xffFFA057)),
                        ),
                      ),
                      Positioned.fill(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Image.asset(
                                'images/pin4.png',
                                    height: 64,
                                    width: 64,
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                      Text("Realtime Map",
                                            style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontFamily: 'Avenir',
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text("Unchai",
                                            style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Avenir',
                                            ),
                                      ),
                    ]
                  ),
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
                  height: 150,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Status(),
                          ));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                    ),
                    padding: EdgeInsets.all(0),
                    child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(colors: [
                            Color(0xffFF5B95), Color(0xffF8556D)
                          ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffF8556D),
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: CustomPaint(
                    size: Size(100, 150),
                    painter: CustomCardShapePainter(24,
                        Color(0xffFF5B95), Color(0xffF8556D)),
                  ),
                ),
                Positioned.fill(
                  child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            'images/checked.png',
                            height: 44,
                            width: 44,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Students Status",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w700),
                                ),
                                Text("Unchai",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                  ),
                                ),
                              ]
                          ),
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
                        height: 150,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Notifications(),
                                ));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)
                          ),
                          padding: EdgeInsets.all(0),
                          child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(colors: [
                                  Color(0xffD76EF5), Color(0xff8F7AFE)
                                ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff8F7AFE),
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: CustomPaint(
                          size: Size(100, 150),
                          painter: CustomCardShapePainter(24,
                              Color(0xffD76EF5), Color(0xff8F7AFE)),
                        ),
                      ),
                      Positioned.fill(
                        child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'images/notification.png',
                                  height: 44,
                                  width: 44,
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Notifications",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontFamily: 'Avenir',
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text("Unchai",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Avenir',
                                        ),
                                      ),
                                    ]
                                ),
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
                        height: 150,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Setting(),
                                ));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)
                          ),
                          padding: EdgeInsets.all(0),
                          child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(colors: [
                                  Color(0xff42E695), Color(0xff3BB2B8)
                                ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff3BB2B8),
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: CustomPaint(
                          size: Size(100, 150),
                          painter: CustomCardShapePainter(24,
                              Color(0xff42E695), Color(0xff3BB2B8)),
                        ),
                      ),
                      Positioned.fill(
                        child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'images/settings.png',
                                  height: 44,
                                  width: 44,
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Settings",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontFamily: 'Avenir',
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text("Unchai",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Avenir',
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ]
                        ),
                      ),
                    ]
                ),
                SizedBox(height: 10,),
          //Color(0xff6DC8F3), Color(0xff73A1F9)

          ]
          ),
        ),
      ),
      ),
    );
  }
}
    class CustomCardShapePainter extends CustomPainter {
    final double radius;
    final Color startColor;
    final Color endColor;

    CustomCardShapePainter(this.radius, this.startColor, this.endColor);

    @override
    void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
    Offset(0, 0), Offset(size.width, size.height), [
    HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
    endColor
    ]);

    var path = Path()
    ..moveTo(0, size.height)
    ..lineTo(size.width - radius, size.height)
    ..quadraticBezierTo(
    size.width, size.height, size.width, size.height - radius)
    ..lineTo(size.width, radius)
    ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
    ..lineTo(size.width - 1.5 * radius, 0)
    ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
    ..close();

    canvas.drawPath(path, paint);
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    return true;


  }
}
