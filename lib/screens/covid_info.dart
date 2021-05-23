import 'package:athijeevana/widgets/InfoCard.dart';
import 'package:flutter/material.dart';

class covidInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Statistics",
                  style: TextStyle(
                      color: Colors.blueGrey[700],
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text("Today: 03-May-2021",
                    style: TextStyle(
                        color: Colors.blueGrey[700],
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                infoCard("14M", "Total Cases", Icon(Icons.taxi_alert)),
                infoCard("10599+", "New Cases", Icon(Icons.add)),
                infoCard(
                    "22674", "Recovered", Icon(Icons.access_alarm_rounded)),
                infoCard("240", "Death", Icon(Icons.access_alarm_rounded)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
