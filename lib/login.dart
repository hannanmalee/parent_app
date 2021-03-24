import 'package:flutter/material.dart';
import 'package:parent_app/signUp.dart';
import 'auth_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parent_app/fadeAnimation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 100,),
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    "Hello,",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22
                                    ),
                                  )
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    "Unchai",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 34,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                              ),
                            ],
                          ),
                          FadeAnimation(1.5,Container(
                            height: MediaQuery.of(context).size.height/3,
                            padding: EdgeInsets.only(left: 25,top: 40),
                            child: Image(
                              image: AssetImage("images/pin2.png"),
                              height: 230,
                              width: 230,
                            ),
                          ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),


                      Container(
                        width: 330,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffFE5A3F)
                                ),
                              ),
                            ),
                            TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontSize: 16
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffFE5A3F)
                                      )
                                  ),
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Color(0xffFE5A3F),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 330,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffFE5A3F)
                                ),
                              ),
                            ),
                            TextField(
                              controller: _passwordController,
                              obscureText: true,
                              style: TextStyle(
                                  fontSize: 16
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffFE5A3F)
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Color(0xffFE5A3F),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),

                      Container(
                        height: 55,
                        child: RaisedButton(
                          onPressed: ()async {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              showToastMessage("Email and password cannot be empty");
                              return;
                            }
                            if(_passwordController.text.length<6){
                              showToastMessage("minimum password 6 characters");
                              return;
                            }
                            try {
                              final user = await AuthHelper.signInWithEmail(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              if (user != null) {
                                print("login successful");
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)

                          ),
                          padding: EdgeInsets.all(0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffFE5A3F),
                                  Color(0xffE67332)
                                ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(30)

                            ),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 260.0, minHeight: 60.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Log In",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Container(
                        height: 55,
                        child: RaisedButton(
                          onPressed: ()async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SignUp(),
                                ));
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
                                "Sign Up",
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
                ],
              ),
            ],
          ),
        ),
      ),
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
}