import 'package:flutter/material.dart';
import 'package:untitled2/models/number_toku.dart';

import '../models/number_toku.dart';

class number extends StatelessWidget {
  const number({
    super.key,
    required this.numbers,
  });
  final Number numbers;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEF9235),
      height: 85,
      child: Row(
        children: [
          Container(
              color: Color(0xffFFF6DC), child: Image.asset(numbers.image)),
          Padding(
            padding: EdgeInsets.only(left: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  numbers.jpNum,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  numbers.enNum,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
