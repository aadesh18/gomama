import 'package:flutter/material.dart';
import 'package:gomama/components/analysis_card.dart';
import 'package:gomama/components/neuButton.dart';
import 'package:gomama/constants.dart';
import 'package:gomama/screens/bookings.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isButtonPressed = false;

  void buttonPressed() {
    setState(() {
      if (isButtonPressed == false) {
        isButtonPressed = true;
      } else if (isButtonPressed == true) {
        isButtonPressed = false;
      }
    });
  }

  void animationEnded() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BookingScreen()));
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Icon(
                //   Icons.account_circle_outlined,
                //   size: 30,
                //   color: Colors.black,
                // ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Welcome Home, ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Alicia",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Center(
                //   child: Container(
                //     height: 500,
                //     width: MediaQuery.of(context).size.width - 40,
                //     decoration: BoxDecoration(
                //       color: Colors.grey.shade300,
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //     child: AnalysisCard(
                //       balance: "1983.23",
                //       income: "2342",
                //       expense: "3432",
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                NeuButton(
                    isButtonPressed: false,
                    child: AnalysisCard(
                      balance: "1983.23",
                      income: "2342",
                      expense: "3432",
                    ),
                    onTap: () {},
                    onEnd: () {},
                    height: 450,
                    width: 350),
                SizedBox(
                  height: 20,
                ),
                NeuButton(
                    isButtonPressed: isButtonPressed,
                    child: isButtonPressed
                        ? Lottie.asset('assets/loading.json')
                        : Center(
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "My Bookings",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 12,
                              )
                            ],
                          )),
                    onEnd: animationEnded,
                    onTap: buttonPressed,
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
