import 'package:castify/constants/constants.dart';
import 'package:flutter/material.dart';

class OnBoardScreen1 extends StatelessWidget {
  const OnBoardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return _getMainBody(context);
  }

  Widget _getMainBody(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.orangeColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              left: 24,
              top: 10,
              child: Image.asset(
                "images/dialog_dots.png",
                height: 85,
                width: 35,
              ),
            ),
            Positioned(
              top: 70,
              child: Column(
                children: [
                  Text(
                    "کستیفای",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "...در هر شرایطی",
                    style: TextStyle(
                      color: MyColor.whiteColor,
                      fontSize: 16,
                      fontFamily: "SM",
                    ),
                  ),
                  Image.asset(
                    "images/dialog_pic1.png",
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 24,
              bottom: 10,
              child: Image.asset(
                "images/dialog_dots.png",
                height: 85,
                width: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
