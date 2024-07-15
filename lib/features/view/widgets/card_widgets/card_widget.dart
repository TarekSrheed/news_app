import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:news_app_flutter/core/res/app_style.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String date;
  final String image;
  CardWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      height: 84,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ExpandableText(
                  style: itemTwoTitleStyle,
                  linkTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 7,
                      fontWeight: FontWeight.w700),
                  title,
                  readMoreText: 'Read more',
                  readLessText: 'Read less',
                ),
                Text(
                  date,
                  style: itemTwoDateStyle,
                ),
                ExpandableText(
                  style: itemTwoSubTitleStyle,
                  linkTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 7,
                      fontWeight: FontWeight.w700),
                  subTitle,
                  readMoreText: 'Read more',
                  readLessText: 'Read less',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.network(
              width: 140,
              height: 84,
              image,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image);
              },
            ),
          ),
        ],
      ),
    );
  }
}
