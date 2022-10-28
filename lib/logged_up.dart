import 'package:authen/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Logged extends StatelessWidget {
  const Logged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold
      (

      appBar: AppBar(
        title:Text("welcome to our app") ,
        actions: [
          TextButton(onPressed:(){final provider=Provider.of<Google_sign_in_Provider>(context,listen: false);
          provider.googleLogout();}, child:Text(" Log out",
          style: TextStyle(
            color: Colors.black
          ),))

        ],
      ),
      body: Center(
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            CircleAvatar(
              radius:50 ,
              backgroundImage: NetworkImage(
                
                user.photoURL!
              ),
            ),
            SizedBox(height: 10,),
            Text("Name : " + user.displayName! ),
            SizedBox(height: 10,),
            // I Can not display the Email =>>>
            Text("Email : "+ user.isAnonymous.toString()!)
          ],
        ),
      )
    );
  }
}
