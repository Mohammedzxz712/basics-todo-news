import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  String? text;
  Color? color;
  Function()? ontap;

  Category({this.text, this.color, this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 15),
        color: color,
        width: double.infinity,
        child: Text(
          text!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
