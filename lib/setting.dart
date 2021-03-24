import 'package:flutter/material.dart';
import 'auth_helper.dart';
import 'customShape.dart';


class Setting extends StatelessWidget {
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

                Text('Settings', style: TextStyle(color: Colors.white, fontSize: 20,fontWeight:FontWeight.w400,),),

              ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 120)),
      body: SingleChildScrollView(

        child: Center(
          child: Container(
            height: 40,
            child: RaisedButton(
              onPressed: () {
                AuthHelper.logOut();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.all(0),
              child: Ink(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 260.0, minHeight: 60.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Log out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffFE5A3F),
                        fontSize: 18
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}


