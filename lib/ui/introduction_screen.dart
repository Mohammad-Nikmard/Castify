import 'package:castify/constants/constants.dart';
import 'package:castify/ui/main_screen.dart';
import 'package:castify/ui/on_board_screens/on_board1.dart';
import 'package:castify/ui/on_board_screens/on_board2.dart';
import 'package:castify/ui/on_board_screens/on_board3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final _controller = PageController();
  bool isLatPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                isLatPage = (index == 2);
              });
            },
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: [
              OnBoardScreen1(),
              OnBoardScreen2(),
              OnBoardScreen3(),
            ],
          ),
          Positioned(
            bottom: 164,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                dotColor: MyColor.greyColor,
                activeDotColor: MyColor.whiteColor,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ),
          Positioned(
            bottom: 91,
            child: GestureDetector(
              onTap: () {
                if (!isLatPage) {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                } else if (isLatPage) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                }
              },
              child: Container(
                height: 48,
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36.5),
                  color: MyColor.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      SizedBox(width: 72),
                      Text(
                        "شروع کنید",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(width: 45),
                      Image.asset("images/arrow-circle-right.png"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
