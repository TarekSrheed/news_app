import 'package:flutter/material.dart';
import 'package:news_app_flutter/core/res/app_color.dart';
import 'package:news_app_flutter/core/res/app_style.dart';

class LatestNewsWidget extends StatelessWidget {
  final String title;
  final String image;
  final String date;
  final String name;
  LatestNewsWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.date,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 85,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 30, top: 10, right: 30),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: lightGrey,
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: itemTitleStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      name,
                      style: itemSubTitleStyle,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      date,
                      style: itemDateStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              width: 85,
              height: 50,
              image,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image);
              },
            ),
          )
        ],
      ),
    );
  }
}
