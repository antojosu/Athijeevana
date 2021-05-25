import 'package:athijeevana/widgets/requirementCard.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequirementCat extends StatefulWidget {
  final String cat;
  RequirementCat({required this.cat});
  @override
  _RequirementCatState createState() => _RequirementCatState();
}

class _RequirementCatState extends State<RequirementCat> {
  late Stream<QuerySnapshot> _catStream;

  @override
  void initState() {
    _catStream = FirebaseFirestore.instance.collection(widget.cat).snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cat + " Requirements",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
              SizedBox(
                height: 3.h,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _catStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  if (snapshot.hasData) {
                    return ListView(
                      shrinkWrap: true,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return SizedBox(
                            height: 25.h,
                            child: requirementCard(
                              (document.data() as dynamic)['description'],
                              (document.data() as dynamic)['fullname'],
                              (document.data() as dynamic)['category'],
                              (document.data() as dynamic)['phone'],
                            )
                            //widget.color),
                            );
                      }).toList(),
                    );
                  } else {
                    return Text("No Data");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
