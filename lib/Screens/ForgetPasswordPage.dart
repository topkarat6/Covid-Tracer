import 'package:covid19_app/Screens/LoginPage.dart';
import 'package:covid19_app/Widgets/background-image.dart';
import 'package:covid19_app/Widgets/palette.dart';
import 'package:covid19_app/Widgets/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgetPasswordPage extends StatelessWidget {
  TextEditingController t1 = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Backgroundimage(
          image: AssetImage("assets/images/12.jpg"),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "#Stay Home",
                          style: kalertdialog,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text(
                      "Use an email address to renew credit.",
                      style: kforget,
                    ),
                    Container(
                      child: Column(
                        children: [
                          textField(
                            icon: FontAwesomeIcons.solidEnvelope,
                            hint: "e-mail",
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.done,
                            istrue: false,
                            textEdit: t1,
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 60,
                            width: 340,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.redAccent,
                                textStyle: TextStyle(
                                    fontSize: 30, fontStyle: FontStyle.italic),
                              ),
                              onPressed: () {
                                auth.sendPasswordResetEmail(
                                    email: t1.text.trim());
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text("Bilgilendirme"),
                                    content: Text(
                                        "Parola yenileme bağlantısı email hesabınıza gönderilmiştir."),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          },
                                          child: Text("Close"))
                                    ],
                                  ),
                                );
                              },
                              child: Text("Submit"),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text("has you any account?"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
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
