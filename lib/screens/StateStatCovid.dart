import 'dart:convert';

import 'package:athijeevana/model/covid.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CovidState extends StatefulWidget {
  @override
  _CovidStateState createState() => _CovidStateState();
}

class _CovidStateState extends State<CovidState> {
  void getRegional() async {
    var response =
        await Dio().get("https://api.rootnet.in/covid19-in/stats/latest");
    Map<String, dynamic> map = response.data['data']['summary'];
    print(map);
  }

  @override
  void initState() {
    super.initState();
    getRegional();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(child: Text("hlo")),
        ),
      ),
    );
  }
}
