import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<BarChartGroupData> barGroups = [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
            toY: 1 * 2,
            color: Colors.grey.shade800,
            width: 25,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
                color: Colors.grey.shade200, toY: 24, show: true)),
      ],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
            toY: 3 * 2,
            color: Colors.grey.shade800,
            width: 25,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
                color: Colors.grey.shade200, toY: 24, show: true)),
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
            toY: 4 * 2,
            color: Colors.grey.shade800,
            width: 25,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
                color: Colors.grey.shade200, toY: 24, show: true)),
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
            toY: 5 * 2,
            color: Colors.grey.shade800,
            width: 25,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
                color: Colors.grey.shade200, toY: 24, show: true)),
      ],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
            toY: 6 * 2,
            color: Colors.grey.shade800,
            width: 25,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
                color: Colors.grey.shade200, toY: 24, show: true)),
      ],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
            toY: 2 * 2,
            color: Colors.grey.shade800,
            width: 25,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
                color: Colors.grey.shade200, toY: 24, show: true)),
      ],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
            toY: 7 * 2,
            color: Colors.grey.shade800,
            width: 25,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
                color: Colors.grey.shade200, toY: 24, show: true)),
      ],
    ),
  ];

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
        color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text(
          "S",
          style: style,
        );
        break;
      case 1:
        text = const Text(
          "M",
          style: style,
        );
        break;
      case 2:
        text = const Text(
          "T",
          style: style,
        );
        break;
      case 3:
        text = const Text(
          "W",
          style: style,
        );
        break;
      case 4:
        text = const Text(
          "T",
          style: style,
        );
        break;
      case 5:
        text = const Text(
          "F",
          style: style,
        );
        break;
      case 6:
        text = const Text(
          "S",
          style: style,
        );
        break;
      default:
        text = const Text(
          "S",
          style: style,
        );
        break;
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.pink.shade50,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "My Bookings",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  groupsSpace: 10, // Spacing between bar groups
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 24, // Set the maximum y-axis value
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true, getTitlesWidget: getBottomTitles),
                    ),
                  ),

                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: barGroups,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Bookings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            Container(
              height: 800,
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 40,
                    child: ListTile(
                      title: Text("Alice Wonderland"),
                      subtitle: Text(
                        "Blacksburg, VA",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      trailing: Text(
                        "1 hr",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 40,
                    child: ListTile(
                      title: Text("Gwen Stacy"),
                      subtitle: Text(
                        "Queens, NYC",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      trailing: Text(
                        "3 hr",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 40,
                    child: ListTile(
                      title: Text("Wonder Woman"),
                      subtitle: Text(
                        "Themyscira, Greece",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      trailing: Text(
                        "4 hr",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 40,
                    child: ListTile(
                      title: Text("Hermione Granger"),
                      subtitle: Text(
                        "London, UK",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      trailing: Text(
                        "5 hrs",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 40,
                    child: ListTile(
                      title: Text("Kim Kardashian"),
                      subtitle: Text(
                        "Beverly Hills, LA",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      trailing: Text(
                        "6 hr",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 40,
                    child: ListTile(
                      title: Text("Angelina Jolie"),
                      subtitle: Text(
                        "Los Feliz, LA",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      trailing: Text(
                        "2 hr",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
