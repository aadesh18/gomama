import 'dart:math';

import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:gomama/booking_data.dart';
import 'package:gomama/components/analysis_card.dart';
import 'package:gomama/components/neuButton.dart';
import 'package:gomama/screens/bookings.dart';
import 'package:gomama/screens/search_page_results.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Your Profile",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
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
                MatchCard(
                    name: "Alicia Cara",
                    phone: "2026820938",
                    height: 550,
                    hours: Random().nextInt(200),
                    starRating: StarRating(
                      starCount: 4,
                      value: 4,
                      activeStarColor: Colors.yellow.shade900,
                    ),
                    location: "Blacksburg, VA",
                    
                    photoLocation: "assets/photo1.jpg")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
