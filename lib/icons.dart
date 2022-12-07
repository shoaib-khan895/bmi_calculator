import 'package:flutter/cupertino.dart';

class ReuseIcon extends StatelessWidget {
  final String text;
  final IconData disIcon;
  const ReuseIcon({Key? key, required this.text, required this.disIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          disIcon,
          size: 170,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}