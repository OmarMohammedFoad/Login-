import 'package:authen/logged_up.dart';
import 'package:authen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot)
           {
            if(snapshot.connectionState==ConnectionState.waiting)
              {
                print("sss");
                return Center(child: CircularProgressIndicator());
              }
            else if (snapshot.hasData)
            {
              print("sss2323");

              return Logged();
            }
            else if (snapshot.hasError) {
              return Center(child: Text("Something Wrong happend"))
;          }
            else {
              print("sssssssss");
              return Login();
            }
          }
      ),
    );
  }
}
