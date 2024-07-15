import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String label;
  TabWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        height: 27,
        width: 54,
        child: Text(label),
      ),
    );
  }
}
