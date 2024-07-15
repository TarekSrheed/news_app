import 'package:flutter/material.dart';
import 'package:news_app_flutter/core/res/app_color.dart';
import 'package:news_app_flutter/core/res/app_style.dart';

class Mybotton extends StatelessWidget {
  final String title;
  final String image;
  Mybotton({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 340,
      height: 52,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: lightGrey,
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
        color: darkWhite,
        borderRadius: BorderRadius.circular(41),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: continueStyle,
          )
        ],
      ),
    );
  }
}
