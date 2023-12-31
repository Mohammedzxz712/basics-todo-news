import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;

  // const BmiResultScreen({required this.result,
  //   required this.isMale,
  //   required this.age})

  const BmiResultScreen({
    super.key,
    required this.result,
    required this.isMale,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BmiResultScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender  : ${isMale ? 'Male' : 'Female'} ',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'Result  : ${result.round()}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'Age  :  $age',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
