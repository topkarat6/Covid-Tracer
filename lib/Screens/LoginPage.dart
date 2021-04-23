import 'package:covid19_app/Screens/ForgetPasswordPage.dart';
import 'package:covid19_app/Screens/HomePage.dart';
import 'package:covid19_app/Screens/SinginPage.dart';
import 'package:covid19_app/Widgets/textField.dart';
import 'package:covid19_app/Widgets/background-image.dart';
import 'package:covid19_app/Widgets/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String password;
  bool check;

  Future<void> login(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: t1.text, password: t2.text)
        .then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Backgroundimage(
          image: AssetImage("assets/images/18.jpg"),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Covid-19 Tracer",
                          style: kHeading,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          textField(
                            icon: FontAwesomeIcons.solidEnvelope,
                            hint: "e-mail",
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            istrue: false,
                            textEdit: t1,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          textField(
                            icon: FontAwesomeIcons.lock,
                            hint: "password",
                            inputType: TextInputType.visiblePassword,
                            inputAction: TextInputAction.done,
                            istrue: true,
                            textEdit: t2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.transparent,
                              textStyle: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.italic),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPasswordPage(),
                                ),
                              );
                            },
                            child: Text("Forget Password?"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: 340,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                          textStyle: TextStyle(
                              fontSize: 30, fontStyle: FontStyle.italic),
                        ),
                        onPressed: () {
                          login(context);
                        },
                        child: Text("Login"),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.transparent,
                        textStyle: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SinginPage()));
                      },
                      child: Text("Create a new account?"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
