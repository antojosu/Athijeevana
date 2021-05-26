import 'package:athijeevana/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RequestRequirement extends StatefulWidget {
  @override
  _RequestRequirementState createState() => _RequestRequirementState();
}

class _RequestRequirementState extends State<RequestRequirement> {
  late String name, place, category, description;

  final FirebaseAuth auth = FirebaseAuth.instance;

  final myController = TextEditingController();

  final myController1 = TextEditingController();

  final myController2 = TextEditingController();

  String _categoryValue = "Food";
  List<String> _status = [
    "Food",
    "Ambulance",
    "Bed",
    "Medicine",
    "Oxygen",
    "Plasma"
  ];
  void submitData(BuildContext context) {
    name = myController.text;
    place = myController1.text;
    description = myController2.text;
    var uid = auth.currentUser!.uid;
    var phonenumber = auth.currentUser!.phoneNumber;
    DocumentReference<Map<String, dynamic>> request =
        FirebaseFirestore.instance.collection(_categoryValue).doc(uid);
    var myJSONObj = {
      "uid": uid,
      "fullname": name,
      "place": place,
      "category": _categoryValue,
      "description": description,
      "phone": phonenumber
    };
    request
        .set(myJSONObj)
        .then((value) => print("Request with CustomID added"))
        .catchError((error) => print("Failed to add Request: $error"));

    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black45,
        title: Text(
          "Request Requirement",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: myController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Full Name'),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextFormField(
                controller: myController1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Location'),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Requirement Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 3.h,
              ),
              RadioGroup<String>.builder(
                groupValue: _categoryValue,
                onChanged: (value) => setState(() {
                  _categoryValue = value!;
                }),
                items: _status,
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
                activeColor: Colors.red,
              ),
              SizedBox(
                height: 3.h,
              ),
              TextFormField(
                controller: myController2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Description'),
              ),
              SizedBox(
                height: 3.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (myController.text.isNotEmpty &&
                        myController1.text.isNotEmpty &&
                        myController2.text.isNotEmpty) {
                      submitData(context);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Fill all details",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Container(
                    child: Text("Submit Request"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
