import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NumberPad extends StatelessWidget {
  late final Function(int) onNumSelect;

  NumberPad({required this.onNumSelect});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildButton(1, context),
              buildButton(2, context),
              buildButton(3, context)
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildButton(4, context),
              buildButton(5, context),
              buildButton(6, context)
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildButton(7, context),
              buildButton(8, context),
              buildButton(9, context)
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              blankButton(context),
              buildButton(0, context),
              backButton(context)
            ],
          ),
        )
      ],
    );
  }

  backButton(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        width: 28.w,
        child: GestureDetector(
          onTap: () => onNumSelect(-1),
          child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.amberAccent[400],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Icon(
                  Icons.backspace,
                  size: 3.h,
                  color: Color(0xFF1F1F1F),
                ),
              )),
        ),
      ),
    );
  }

  Widget buildButton(int content, BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        width: 28.w,
        child: GestureDetector(
          onTap: () => onNumSelect(content),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.amberAccent[400],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
                child: Text(
              content.toString(),
              style: TextStyle(fontSize: 2.5.h, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}

Widget blankButton(BuildContext context) {
  return SizedBox(
    width: 28.w,
    child: Container(),
  );
}
