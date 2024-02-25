import 'package:castify/constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, required this.image, required this.title});
  String image;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColor.whiteColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColor.orangeColor,
                ),
                child: Image.asset("images/$image"),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style:
                TextStyle(fontFamily: "SM", color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
