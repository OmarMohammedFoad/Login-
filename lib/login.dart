
import 'package:authen/Homepage.dart';
import 'package:authen/defaultButton.dart';
import 'package:authen/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  bool ispassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: keyForm,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(25),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child:defualt_textform( keytype: TextInputType.emailAddress,
                        controller: EmailController, label:"Email", obsecurred:false, prefix:Icons.email, warning: "the Email must be filled",)
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: defualt_textform(keytype:TextInputType.text ,controller: PasswordController, label:"Password", obsecurred:true, prefix:Icons.lock, warning: "the password must be filled",
                    suffix:  ispassword? Icons.visibility_off:Icons.visibility,
                          ispassword: ispassword,
                          ispressed:(){
                        setState(() {
                          ispassword= !ispassword;
                        });
                          }
                      )
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: default_button(
                          text: "login",
                          background: Colors.deepOrange,

                          function: () {
                            if (keyForm.currentState!.validate()) {
                              print(EmailController.text);
                              print(PasswordController.text);
                            }
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "don\'t have account ?",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            MaterialButton(
                              onPressed: ()  {
                            final provider=Provider.of<Google_sign_in_Provider>(context,listen: false);
                            provider.googleLogin();
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>Home_Page())
                            );

                              },
                              child: Text(
                                " sign in with Gmail !",
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ]),
            ),
          ),
        ));
  }
}
