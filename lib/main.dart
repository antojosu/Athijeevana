import 'package:athijeevana/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AthiJeevanaMain());
}

class AthiJeevanaMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DefaultTabController(length: 2, child: Home()));
      },
    );
  }
}
