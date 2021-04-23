import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19_app/Screens/LoginPage.dart';
import 'package:covid19_app/Widgets/background-image.dart';
import 'package:covid19_app/Widgets/palette.dart';
import 'package:covid19_app/Widgets/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(SinginPage());
}

class SinginPage extends StatelessWidget {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  
  Future<void> ekle(BuildContext context) async {
    if (t4.text != t5.text) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Colors.black,
          title: Text("Uyarı"),
          content: Text("Lütfen şifrenizin aynı olduğundan emin olunuz!"),
          titleTextStyle: kHeading,
          contentTextStyle: kforget,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text("Close"),
            ),
          ],
        ),
      );
    } else {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: t3.text.trim(), password: t4.text.trim())
          .then((value) {
        FirebaseFirestore.instance
            .collection("Users")
            .doc(t3.text)
            .set({
              'name': t1.text.trim(),
              'surname': t2.text.trim(),
              'email': t3.text.trim(),
              'password': t4.text.trim(),
            })
            .whenComplete(
              () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Colors.black,
                  title: Text("Başarılı"),
                  content: Text("Kaydetme işlemi başarılı."),
                  titleTextStyle: kHeading,
                  contentTextStyle: kforget,
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text("Close"),
                    ),
                  ],
                ),
              ),
            )
            .then((value) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()));
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Backgroundimage(
          image: AssetImage("assets/images/2.jpg"),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.cyan.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Registry",
                          style: kHeading,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: textField(
                        icon: Icons.person,
                        hint: "name",
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        istrue: false,
                        textEdit: t1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: textField(
                        icon: Icons.text_format,
                        hint: "Surname",
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        istrue: false,
                        textEdit: t2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: textField(
                        icon: FontAwesomeIcons.solidEnvelope,
                        hint: "e-mail",
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        istrue: false,
                        textEdit: t3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: textField(
                        icon: FontAwesomeIcons.lock,
                        hint: "password",
                        inputType: TextInputType.visiblePassword,
                        inputAction: TextInputAction.next,
                        istrue: true,
                        textEdit: t4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: textField(
                        icon: FontAwesomeIcons.lock,
                        hint: "Confirm Password",
                        inputType: TextInputType.visiblePassword,
                        inputAction: TextInputAction.done,
                        istrue: true,
                        textEdit: t5,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 350,
                        height: 60,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                            textStyle: TextStyle(
                                fontSize: 30, fontStyle: FontStyle.italic),
                          ),
                          onPressed: () {
                            ekle(context);
                          },
                          child: Text("Submitt"),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                                        LoginPage()));
                          },
                          child: Text("has you any account?"),
                        ),
                      ],
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
