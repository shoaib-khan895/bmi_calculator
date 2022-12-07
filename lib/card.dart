import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReuseContainer extends StatelessWidget {
  const ReuseContainer({Key? key, required this.color, this.cardChild})
      : super(key: key);
  final Color color;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: color),
      child: cardChild,
    );
  }
}
