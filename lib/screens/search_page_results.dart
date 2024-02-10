import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gomama/booking_data.dart';
import 'package:gomama/components/analysis_card.dart';
import 'package:gomama/components/neuButton.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:gomama/constants.dart';
import 'package:gomama/database.dart';
import 'package:gomama/screens/root_app.dart';
import 'package:lottie/lottie.dart';

class SearchResultPage extends StatefulWidget {
  String date, startTime, endTime;
  SearchResultPage(
      {super.key,
      required this.date,
      required this.startTime,
      required this.endTime});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  bool isButtonPressed = false;
  List<String> locationList = [
    "Blacksburg, VA",
    "College, MD",
    "Washington D.C"
  ];

  int currentIndex = 10;

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
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => BookingScreen()));
    Database.confirmBooking(
        currentUser!,
        bookingData!.elementAt(0).username,
        widget.date,
        widget.startTime,
        widget.endTime);

    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Lottie.asset('assets/matched.json'),
          );
        });
    await Future.delayed(Duration(seconds: 2));
    changePage();
  }

  changePage() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => RootApp(),
        ),
        (route) => false);
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
                  "Your Top Matches",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 500,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bookingData!.length,
                itemBuilder: (context, index) {
                  currentIndex = index;
                  return MatchCard(
                      name: bookingData!.elementAt(index).name,
                      bookingData: bookingData!.elementAt(index),
                      phone: bookingData!.elementAt(index).phone,
                      hours: Random().nextInt(200),
                      starRating: StarRating(
                        starCount: 4,
                        value: int.parse(bookingData!.elementAt(index).rating),
                        activeStarColor: Colors.yellow.shade900,
                      ),
                      location: locationList[Random().nextInt(3)],
                      photoLocation: "assets/photo${index + 1}.jpg");
                }),
          ),
          SizedBox(
            height: 30,
          ),
          NeuButton(
              isButtonPressed: isButtonPressed,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "I like her!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              )),
              onEnd: animationEnded,
              onTap: buttonPressed,
              height: 100,
              width: 350)
        ],
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  String name, phone;
  BookingData? bookingData;
  StarRating starRating;
  String location;
  String photoLocation;
  int hours;
  double? height;
  //double? width;

  MatchCard({
    required this.name,
    this.bookingData,
    required this.phone,
    required this.starRating,
    required this.location,
    required this.photoLocation,
    required this.hours,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: NeuButton(
        isButtonPressed: false,
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                  scale: 2,
                  image: AssetImage(photoLocation),
                  fit: BoxFit.cover),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('Number of Hours',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('$hours')
                ],
              ),
              Column(
                children: [
                  Text("Rating", style: TextStyle(fontWeight: FontWeight.bold)),
                  starRating
                ],
              )
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('Location',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(location)
                ],
              ),
              Column(
                children: [
                  Text("Contact",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(phone)
                ],
              )
            ],
          ),
          height == null
              ? SizedBox()
              : SizedBox(
                  height: 60,
                ),
          height == null
              ? SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('Email',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('alicia@gmail.com')
                      ],
                    ),
                    Column(
                      children: [
                        Text("Number of Kids",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('2')
                      ],
                    )
                  ],
                ),
        ]),
        onTap: () {},
        onEnd: () {},
        height: height == null ? 450 : height!,
        width: 350,
      ),
    );
  }
}
