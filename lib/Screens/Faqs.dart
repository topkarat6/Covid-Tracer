import 'package:covid19_app/Screens/QuestionPanel.dart';
import 'package:covid19_app/Widgets/FirstPage.dart';
import 'package:flutter/material.dart';

class Faqs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "#Sıkça Sorulan Sorular",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswer.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionTile(
              tilePadding: EdgeInsets.all(10),
              childrenPadding: EdgeInsets.all(10),
              title: Text(DataSource.questionAnswer[index]["Soru"],
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900])),
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      DataSource.questionAnswer[index]["Cevap"],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ],
            );
          }),
    );
  }
}
