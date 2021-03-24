import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parent_app/admin_home.dart';
import 'package:parent_app/driver_home.dart';
import 'package:parent_app/login.dart';
import 'auth_helper.dart';
import 'homePage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          primaryColor: Color(0xffE67332)
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.data != null) {
            UserHelper.saveUser(snapshot.data);
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection("users").doc(snapshot.data.uid).snapshots() ,
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                if(snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  final user = userDoc.data();
                  if(user['role'] == 'user') {
                    return HomePage();
                  }else if (user['role'] == 'admin'){
                    return AdminHomePage();
                  }else{
                  return DriverHomePage();
                  }

                }else{
                  return Material(
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }
              },
            );
          }
          return Login();
        }
    );
  }
}