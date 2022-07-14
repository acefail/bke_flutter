import 'package:bke/presentation/login.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bke/utils/colors.dart';
import 'package:bke/presentation/components/models/walkthroughmodel.dart';
import 'package:bke/presentation/components/walkthrough.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;

  List<WalkThroughModel> walkThroughList = getListWalkThrough();

  @override
  void initState() {
    super.initState();
  }

  Widget getWalkThroughComponent() {
    if (currentIndexPage == 0) {
      return WalkThroughComponentOne();
    } else if (currentIndexPage == 1) {
      return WalkThroughComponentTwo();
    } else {
      return WalkThroughComponentThree();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: context.width(),
              height: context.height(),
              child: PageView(
                controller: pageController,
                children: [
                  WalkThroughComponentOne(),
                  WalkThroughComponentTwo(),
                  WalkThroughComponentThree()
                ],
                onPageChanged: (value) {
                  setState(() => currentIndexPage = value);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Positioned(
              right: 20,
              top: 40,
              child: Text('Skip', style: boldTextStyle(color: primaryColor))
                  .onTap(() {
                LoginScreen().launch(context);
              }),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: DotIndicator(
                pageController: pageController,
                pages: walkThroughList,
                indicatorColor: primaryColor,
                unselectedIndicatorColor: rcSecondaryColor,
              ),
            ),
          ],
        ));
  }
}
