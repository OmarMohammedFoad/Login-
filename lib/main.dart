import 'package:authen/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Homepage.dart';
import 'google_sign_in.dart';

Future   main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>Google_sign_in_Provider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),

        home: Login(),
      ),
    );
  }
}

