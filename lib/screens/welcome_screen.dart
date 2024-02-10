import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gomama/components/neuButton.dart';
import 'package:gomama/screens/signin_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  bool success = false;

  bool onLastPage = false;

  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);

    super.initState();
  }

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
    _btnAnimationController.isActive = true;

    showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: "Sign In",
        context: context,
        pageBuilder: (context, _, __) => Container(
              height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Sign in",
                      style: GoogleFonts.poppins(
                          fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                      child: Text(
                        "Give Yourself the time you deserve",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const SignInForm()
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          // Positioned(
          //   width: MediaQuery.of(context).size.width * 1.7,
          //   bottom: 200,
          //   left: 100,
          //   child: Image.asset("assets/Backgrounds/Spline.png"),
          // ),
          // Positioned(
          //     child: BackdropFilter(
          //         filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10))),
          // const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          // Positioned.fill(
          //     child: BackdropFilter(
          //   filter: ImageFilter.blur(
          //     sigmaX: 30,
          //     sigmaY: 30,
          //   ),
          //   child: const SizedBox(),
          // )),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(20, -1.2),
                    child: Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-2.7, -1.2),
                    child: Container(
                      height: MediaQuery.of(context).size.width / 1.3,
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(2.7, -1.2),
                    child: Container(
                      height: MediaQuery.of(context).size.width / 1.3,
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                    child: Container(),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120,
                            ),
                            Text(
                              'GoMama',
                              style: GoogleFonts.getFont(
                                'Pacifico',
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 70,
                                    height: 1.2,
                                    letterSpacing: 1),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "One Stop Solution for Single Mothers",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  letterSpacing: 0.8),
                            ),
                            Spacer(),
                            NeuButton(
                              onTap: buttonPressed,
                              isButtonPressed: isButtonPressed,
                              onEnd: animationEnded,
                              width: 300,
                              height: 100,
                              child: isButtonPressed
                                  ? Lottie.asset('assets/loading.json')
                                  : Center(
                                      child: Text(
                                      "Let's go",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
