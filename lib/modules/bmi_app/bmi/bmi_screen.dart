import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_result/bmi_result_screen.dart';

class BMISCREEN extends StatefulWidget {
  const BMISCREEN({super.key});

  @override
  State<BMISCREEN> createState() => _BMISCREENState();
}

class _BMISCREENState extends State<BMISCREEN> {
  bool isMale = true;
  double height = 120;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale ? Colors.blue : Colors.grey[400],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Image.asset(
                                'imaages/Gender-Symbol_Male_dark_transparent_Background.png',
                                height: 95,
                                width: 100,
                              ),
                            ),
                            const Text(
                              'Male',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale ? Colors.grey[400] : Colors.blue,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'imaages/Venus_symbol.png',
                              height: 100,
                              width: 80,
                            ),
                            const Text(
                              'Female',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 50),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    Slider(
                        value: height,
                        max: 220,
                        min: 80,
                        onChanged: (value) {
                          height = value;
                          setState(() {});
                          print(value.round());
                        })
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            '${age}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 50),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                heroTag: 'age-',
                                mini: true,
                                child: const Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: 'age+',
                                mini: true,
                                child: const Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            '$weight',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 50),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                heroTag: 'weight-',
                                mini: true,
                                child: const Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                heroTag: 'weight+',
                                mini: true,
                                child: const Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blueAccent,
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                double result = (weight / pow(height / 100, 2));
                print(result.round());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BmiResultScreen(
                            age: age, isMale: isMale, result: result)));
              },
              child: const Text(
                'CALCULATE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
