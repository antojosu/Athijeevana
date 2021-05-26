import 'package:athijeevana/widgets/covidCard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:athijeevana/model/covid.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CovidState extends StatefulWidget {
  @override
  _CovidStateState createState() => _CovidStateState();
}

class _CovidStateState extends State<CovidState> {
  List<covid> covidData = [];
  Future<List<covid>> getRegional() async {
    covidData = [];
    var response =
        await Dio().get("https://api.rootnet.in/covid19-in/stats/latest");
    List<dynamic> map = response.data['data']['regional'];
    for (var u in map) {
      covid coviData = new covid(u["loc"], u["totalConfirmed"].toString(),
          u["discharged"].toString(), u["deaths"].toString());
      covidData.add(coviData);
    }
    return covidData;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
              future: getRegional(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: List.generate(snapshot.data.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: covidCard(snapshot.data[index]),
                      );
                    }),
                  );
                } else {
                  return Center(
                      child: Container(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(),
                  ));
                }
              }),
        ),
      ),
    );
  }
}
