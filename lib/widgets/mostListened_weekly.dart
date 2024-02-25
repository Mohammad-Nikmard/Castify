import 'package:castify/constants/constants.dart';
import 'package:flutter/material.dart';

class MostListenedWeeklyWidget extends StatelessWidget {
  const MostListenedWeeklyWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 271,
      width: 271,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColor.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff2F0F73),
                Color(0xff070210),
              ],
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Positioned(
                left: 25,
                right: 25,
                bottom: -10,
                child: Image.asset("images/$image"),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Image.asset("images/heart.png"),
              ),
              Positioned(
                top: 16,
                left: 165,
                right: 12,
                child: Container(
                  height: 26,
                  width: 77,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: MyColor.whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset("images/icon_hot.png"),
                        SizedBox(width: 5),
                        Text(
                          "پرطرفدار",
                          style: TextStyle(
                            color: MyColor.orangeColor,
                            fontSize: 10,
                            fontFamily: "SM",
                          ),
                        ),
                        SizedBox(width: 6),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 12,
                bottom: 12,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColor.orangeColor,
                  ),
                  child: Center(
                    child: Image.asset("images/Icon_Play.png"),
                  ),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: MyColor.whiteColor,
                          fontSize: 16,
                          fontFamily: "SM"),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "$subTitle : اثر",
                      style: TextStyle(
                          color: Colors.white, fontSize: 10, fontFamily: "SM"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
