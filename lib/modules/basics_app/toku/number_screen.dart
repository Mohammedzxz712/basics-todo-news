import 'package:flutter/material.dart';
import 'package:untitled2/component/number.dart';

import '../../../models/number_toku.dart';

class Numberscreen extends StatelessWidget {
  const Numberscreen({
    super.key,
  });
  final List<Number> num = const [
    Number(image: 'assets/numbers/number_one.png', jpNum: 'Ichi', enNum: 'one'),
    Number(image: 'assets/numbers/number_two.png', jpNum: 'Ni', enNum: 'two'),
    Number(
        image: 'assets/numbers/number_three.png', jpNum: 'San', enNum: 'three'),
    Number(
        image: 'assets/numbers/number_four.png', jpNum: 'Shi', enNum: 'four'),
    Number(image: 'assets/numbers/number_five.png', jpNum: 'Go', enNum: 'five'),
    Number(image: 'assets/numbers/number_six.png', jpNum: 'Roku', enNum: 'six'),
    Number(
        image: 'assets/numbers/number_seven.png',
        jpNum: 'Sebun',
        enNum: 'seven'),
    Number(
        image: 'assets/numbers/number_eight.png',
        jpNum: 'Hachi',
        enNum: 'eight'),
    Number(
        image: 'assets/numbers/number_nine.png', jpNum: 'Kyū', enNum: 'nine'),
    Number(image: 'assets/numbers/number_ten.png', jpNum: 'Jū', enNum: 'ten'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff46322B),
          title: const Text('Numbers'),
        ),
        body: ListView.builder(
            itemCount: num.length,
            itemBuilder: (context, index) {
              return number(
                numbers: num[index],
              );
            }));
  }
}

// List<Widget> getNum(List<Number> num) {
//   List<Widget> numset = [];
//   for (int i = 0; i < num.length; i++) {
//     numset.add(
//       number(
//         numbers: num[i],
//       ),
//     );
//   }
//   return numset;
// }
