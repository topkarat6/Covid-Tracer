import 'package:covid19_app/Screens/AddBlog.dart';
import 'package:covid19_app/Screens/AllBlogs.dart';
import 'package:covid19_app/Screens/News.dart';
import 'package:covid19_app/Screens/Profile.dart';
import 'package:covid19_app/Screens/virusTracer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  return runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  int selectedindex = 0;
  String email;
  final screen = [VirusTracer(), AllBlog(), AddBlog(), News(), Profile()];
  final title = [
    Text("Covid-19 Son Durum"),
    Text("Sizden Gelenler"),
    Text("Bir şeyler yaz..."),
    Text("Haberler"),
    Text("Profil"),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        index: selectedindex,
        items: [
          Icon(
            FontAwesomeIcons.home,
            size: 35,
            color: Colors.black87,
          ),
          Icon(
            FontAwesomeIcons.blog,
            size: 35,
            color: Colors.black87,
          ),
          Icon(
            FontAwesomeIcons.plus,
            size: 35,
            color: Colors.black87,
          ),
          Icon(
            FontAwesomeIcons.newspaper,
            size: 35,
            color: Colors.black87,
          ),
          Icon(
            FontAwesomeIcons.user,
            size: 35,
            color: Colors.black87,
          ),
        ],
        color: Colors.blue,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOutBack,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
      ),
      appBar: AppBar(
        title: title[selectedindex],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: screen[selectedindex],
    );
  }
}
