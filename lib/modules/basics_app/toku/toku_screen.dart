import 'package:flutter/material.dart';
import 'package:untitled2/component/category.dart';

import 'number_screen.dart';

class TokuScreen extends StatelessWidget {
  const TokuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEF6DB),
      appBar: AppBar(
        backgroundColor: Color(0xff46322B),
        title: const Text(
          'Toku',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
      body: Column(
        children: [
          Category(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Numberscreen();
                  },
                ),
              );
            },
            text: 'members',
            color: const Color(0xffEF9235),
          ),
          Category(
            text: 'Familymembers',
            color: const Color(0xff558B37),
          ),
          Category(
            text: 'Colors',
            color: const Color(0xff79359F),
          ),
          Category(
            text: 'Phases',
            color: const Color(0xff50ADC7),
          ),
        ],
      ),
    );
  }
}
