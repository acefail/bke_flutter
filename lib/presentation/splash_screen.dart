import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bke/utils/colors.dart';
import 'package:bke/presentation/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
    await 3.seconds.delay;
    finish(context);
    WelcomeScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -110,
            right: -60,
            child: Icon(Icons.cloud,
                color: Colors.white.withOpacity(0.2), size: 350),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: radius(16),
                  color: Colors.white.withOpacity(0.2)),
              transform: Matrix4.rotationZ(6),
            ),
          ),
          Positioned(
            top: 100,
            left: -200,
            child: Image.asset('images/HCMUT_official_logo.png',
                height: 350, color: Colors.white.withOpacity(0.2)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: Text('BK',
                    style: boldTextStyle(
                        size: 68,
                        color: Colors.white,
                        fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
              ),
              Text('English',
                  style: boldTextStyle(
                      size: 50,
                      color: Colors.white,
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
            ],
          ).center(),
        ],
      ),
      backgroundColor: primaryColor,
    );
  }
}
