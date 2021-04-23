import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: new LinearGradient(
                      colors: [
                        const Color(0xFF880E4F),
                        const Color(0xFF4A148C),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                child: Text(                 
                  "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 183311054 numaralı Öğrenci İslam Topkara tarafından 23 Nisan 2021 günü yapılmıştır.",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color: Colors.grey[300]),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
