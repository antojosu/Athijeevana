import 'package:athijeevana/screens/StartScreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(AthiJeevanaMain());
}

class AthiJeevanaMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false, home: StartScreen());
      },
    );
  }
}
