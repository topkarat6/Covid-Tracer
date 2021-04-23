import 'dart:convert';

import 'package:covid19_app/Screens/CountryPage.dart';
import 'package:covid19_app/Widgets/FirstPage.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';

class VirusTracer extends StatefulWidget {
  @override
  _VirusTracerState createState() => _VirusTracerState();
}

class _VirusTracerState extends State<VirusTracer> {
  Future<void> getWorld() async {
    String _url = "https://disease.sh/v3/covid-19/all";
    final Uri _uri = Uri.parse(_url);
    http.Response response = await http.get(_uri);

    setState(() {
      wordData = json.decode(response.body);
    });
  }

  Future<void> getTurkey() async {
    String _url = "https://disease.sh/v3/covid-19/countries/Turkey?strict=true";
    final Uri _uri = Uri.parse(_url);
    http.Response response = await http.get(_uri);

    setState(() {
      turkeyDate = json.decode(response.body);
    });
  }

  List countryData;
  Future<void> getCountries() async {
    String _url = "https://disease.sh/v3/covid-19/countries?sort=cases";
    final Uri _uri = Uri.parse(_url);
    http.Response response = await http.get(_uri);
    if (mounted) {
      setState(() {
        countryData = json.decode(response.body);
      });
    }
  }

  String format =
      formatDate(DateTime.now(), [dd, '-', mm, '-', yyyy]).toString();
  Map wordData;
  Map turkeyDate;
  @override
  void initState() {
    super.initState();
    getWorld();
    getCountries();
    getTurkey();
  }

  DateTime currentTime = new DateTime(DateTime.now().year, DateTime.now().month,
      (DateTime.now().day), DateTime.now().hour, DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wordData == null || turkeyDate == null || countryData == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sentence(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " #Türkiye",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]),
                          textAlign: TextAlign.left,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Ülkeler",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GridSystemTurkey(
                      TurkeyData: turkeyDate,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      " # Pasta Grafiği",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PieChart(dataMap: {
                      'Vaka': turkeyDate["cases"].toDouble(),
                      'Ölümler': turkeyDate["deaths"].toDouble(),
                      'İyileşen hastalar': turkeyDate["recovered"].toDouble(),
                    }),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      " #Dünya Geneli",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GridSystem(
                      dunyaData: wordData,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoPanel(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " #En çok etkilenen ülkeler",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MostAffected(
                      countryData: countryData,
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
    );
  }
}
