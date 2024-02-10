import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomama/screens/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Column(
        children: [
          Text(
            'GoMama',
            style: GoogleFonts.getFont(
              'Pacifico',
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  height: 1.1,
                  letterSpacing: 1),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "One Stop Solution for Single Mothers",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 0.8),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      nextScreen: const WelcomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
