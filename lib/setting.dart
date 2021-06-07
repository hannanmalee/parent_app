import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_helper.dart';
import 'customShape.dart';
import 'login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';


class Setting extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<Setting> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  String email;


  @override
  void initState() {
    super.initState();
    this.getUser();
  }

  getUser() async {

    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
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

                Text('Settings', style: GoogleFonts.fahkwang(textStyle:TextStyle(color: Colors.white, fontSize: 32,fontWeight:FontWeight.w400, ),),),

              ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 120)),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
              width: double.infinity,
              height: 120,
                child: !isloggedin
                    ? CircularProgressIndicator()
                 : Container(
                    alignment: Alignment(0.0,2.5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn2.iconfinder.com/data/icons/people-flat-design/64/Face-Profile-User-Man-Boy-Person-Avatar-512.png"
                      ),
                      radius: 60.0,
                    ),
                  ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Hello"
                ,style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400
              ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${user.email}"
                ,style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8, top: 0, bottom: 0),
                child: Row(
                  children: [
                    Text(
                      "ACCOUNT",style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                elevation: 0,
                shadowColor: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8.0,
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.blue[800],
                      ),
                      title: Text("Change Name"),
                      trailing: Icon(Icons.edit),
                      onTap: () {},
                    ),
                    _buildDivider(),
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blue[800],
                      ),
                      title: Text("Change Phone number"),
                      trailing: Icon(Icons.edit),
                      onTap: () {},
                    ),
                    _buildDivider(),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.blue[800],
                      ),
                      title: Text("Change Location"),
                      trailing: Icon(Icons.edit),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8, top: 0, bottom: 0),
                child: Row(
                  children: [
                    Text(
                      "NOTIFICATIONS", style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                shadowColor: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 8.0,
                ),
                child: Column(
                  children: <Widget>[
                    SwitchListTile(
                      activeColor: Colors.blue,
                      value: true,
                      title: Text("Received notification"),
                      onChanged: (val) {},
                    ),
                    _buildDivider(),
                    SwitchListTile(
                      activeColor: Colors.blue,
                      value: false,
                      title: Text("Received App Updates"),
                      onChanged: (val) {},
                    ),
                  ],
                ),
              ),

              Container(
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {
                      AuthHelper.logOut();
                      showToastMessage("Logged out");
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


            ],
          ),
        )
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

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      // color: Colors.grey.shade300,
    );

  }
}


