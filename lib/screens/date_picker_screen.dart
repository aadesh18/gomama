import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:gomama/components/neuButton.dart';
import 'package:gomama/constants.dart';
import 'package:gomama/database.dart';
import 'package:gomama/screens/home_page.dart';
import 'package:gomama/screens/search_page_results.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  bool isButtonPressed = false;

  String? startTime, endTime, date;

  void buttonPressed() {
    setState(() {
      if (isButtonPressed == false) {
        isButtonPressed = true;
      } else if (isButtonPressed == true) {
        isButtonPressed = false;
      }
    });
  }

  void animationEnded() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Lottie.asset("assets/loading.json"),
          );
        });
    await Database.getMatch(currentUser!, "$startTime to $endTime")
        .then((value) async {
      await Future.delayed(Duration(seconds: 2));
      changePage();
    });
  }

  changePage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchResultPage(
                  startTime: startTime!,
                  endTime: endTime!,
                  date: date!,
                )));
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
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Make a booking",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Choose a Date",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    BottomPicker.date(
                      title: "Choose a date",
                      titleStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                      buttonSingleColor: Colors.black,
                      onChange: (index) {
                        print(index);
                      },
                      onSubmit: (index) {
                        setState(() {
                          print(index);

                          date = DateFormat.yMd().format(index);
                        });
                      },
                    ).show(context);
                  },
                  child: Text(
                    date == null ? "Aug 23, 2022" : date!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Choose Start Time",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    BottomPicker.time(
                      initialTime: Time.now(),
                      title: "Choose Start Time",
                      titleStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                      buttonSingleColor: Colors.black,
                      onChange: (index) {
                        print(index);
                      },
                      onSubmit: (index) {
                        print(index);
                        setState(() {
                          startTime = DateFormat.Hm().format(index);
                        });
                        ;
                      },
                    ).show(context);
                  },
                  child: Text(
                    startTime == null ? "8:00 HRS" : "${startTime!} HRS",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Choose End Time",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    BottomPicker.time(
                      initialTime: Time.now(),
                      title: "Choose End Time",
                      titleStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                      buttonSingleColor: Colors.black,
                      onChange: (index) {
                        print(index);
                      },
                      onSubmit: (index) {
                        setState(() {
                          print(index);
                          endTime = DateFormat.Hm().format(index);
                        });
                      },
                    ).show(context);
                  },
                  child: Text(
                    endTime == null ? "17:00 HRS" : "${endTime!} HRS",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                NeuButton(
                    isButtonPressed: isButtonPressed,
                    child: Center(
                      child: Text(
                        "Find Matches",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    onTap: buttonPressed,
                    onEnd: animationEnded,
                    height: 100,
                    width: 350)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
