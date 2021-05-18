import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  late final Function(int) onNumSelect;

  NumberPad({required this.onNumSelect});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [buildButton(1), buildButton(2), buildButton(3)],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [buildButton(4), buildButton(5), buildButton(6)],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [buildButton(7), buildButton(8), buildButton(9)],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [blankButton(), buildButton(0), backButton()],
          ),
        )
      ],
    );
  }

  backButton() {
    return Expanded(
      child: GestureDetector(
        onTap: () => onNumSelect(-1),
        child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.amberAccent[400],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Icon(
                Icons.backspace,
                size: 28,
                color: Color(0xFF1F1F1F),
              ),
            )),
      ),
    );
  }

  Widget buildButton(int content) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onNumSelect(content),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          decoration: BoxDecoration(
              color: Colors.amberAccent[400],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
              child: Text(
            content.toString(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

Widget blankButton() {
  return Expanded(
    child: Container(),
  );
}
