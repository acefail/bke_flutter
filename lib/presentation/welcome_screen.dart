import 'package:bke/presentation/login.dart';
import 'package:bke/presentation/walkthrough_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bke/utils/colors.dart';
import 'package:bke/presentation/components/welcome_image.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    setStatusBarColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WelcomeImageComponent(),
            100.height,
            Text('Indulge in vast material of English',
                    style: secondaryTextStyle(color: rcSecondaryTextColor))
                .paddingSymmetric(horizontal: 32),
            16.height,
            Container(
                    width: context.width(),
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 89, 132, 252),
                          Color.fromARGB(255, 151, 72, 255),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: radius(32),
                    ),
                    child: Text('I am new',
                            style: boldTextStyle(size: 18, color: Colors.white))
                        .center())
                .onTap(() {
              WalkThroughScreen().launch(context);
            }),
            16.height,
            Container(
                    width: context.width(),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 151, 72, 255),
                          Color.fromARGB(255, 89, 132, 252),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: radius(32),
                    ),
                    child: Text('I\'ve been here',
                            style: boldTextStyle(size: 18, color: Colors.white))
                        .center())
                .onTap(() {
              LoginScreen().launch(context);
            }),
            50.height,
          ],
        ),
      ),
    );
  }
}
