import 'package:castify/constants/constants.dart';
import 'package:castify/model/playlistEnum.dart';
import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';

// ignore: must_be_immutable
class PlayListWidget extends StatelessWidget {
  PlayListWidget({
    super.key,
    required this.image,
    required this.subTitle,
    required this.title,
    required this.pageCounter,
    required this.type,
    required this.timerLength,
    required this.passedTime,
  });
  String image;
  String title;
  String subTitle;
  String pageCounter;
  PlayListType type;
  String timerLength;
  String passedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 73,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColor.whiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _getType(type),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 15),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "SM",
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontFamily: "SM",
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            SizedBox(width: 7),
            Container(
              height: 57,
              width: 57,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage("images/$image"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getType(PlayListType type) {
    switch (type) {
      case PlayListType.ebook:
        return Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: MyColor.orangeColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset("images/book.png"),
              ),
            ),
            SizedBox(width: 15),
            Text(
              "${pageCounter} صفحه ",
              style: TextStyle(
                color: MyColor.greyColor,
                fontFamily: "SM",
                fontSize: 10,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        );

      case PlayListType.playlist:
        return Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: MyColor.orangeColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  "images/Play.png",
                  height: 18,
                  width: 18,
                ),
              ),
            ),
            SizedBox(width: 15),
            _getTrack(),
          ],
        );

      default:
        return Text("");
    }
  }

  Widget _getTrack() {
    return Column(
      children: [
        SizedBox(height: 35),
        Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 5),
                Container(
                  height: 3,
                  width: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: MyColor.greyColor,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      timerLength,
                      style: TextStyle(
                          color: MyColor.greyColor,
                          fontSize: 12,
                          fontFamily: "SM"),
                    ),
                    Text(
                      " از ",
                      style: TextStyle(
                          color: MyColor.greyColor,
                          fontSize: 12,
                          fontFamily: "SM"),
                    ),
                    Text(
                      passedTime,
                      style: TextStyle(
                          color: MyColor.greyColor,
                          fontSize: 12,
                          fontFamily: "SM"),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 3.1,
              child: Row(
                children: [
                  Container(
                    height: 3,
                    width: widthController(timerLength, passedTime),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: MyColor.orangeColor,
                    ),
                  ),
                  Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColor.whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColor.orangeColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Container(
                            height: 3,
                            width: 53,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColor.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  double widthController(String timerLength, String passedTime) {
    String englishTimerLength = convertFaToEn(timerLength);

    String englishPassedTime = convertFaToEn(passedTime);

    List from = englishTimerLength.split(":").map((e) => e).toList();
    int fromMinuteTimer = int.parse(from.join(""));

    List to = englishPassedTime.split(":").map((e) => e).toList();
    int toMinuteTimer = int.parse(to.join(""));

    double initialAmount = (toMinuteTimer / fromMinuteTimer) * 100;

    double finalWidth = ((initialAmount / 112) * 100);

    double result = double.parse(finalWidth.toStringAsFixed(1));

    if (result == 0) {
      result = 0.0;
    } else if (timerLength == "00:00" && passedTime == "00:00") {
      result = 0.0;
    } else {
      return result;
    }
    return result;
  }
}
