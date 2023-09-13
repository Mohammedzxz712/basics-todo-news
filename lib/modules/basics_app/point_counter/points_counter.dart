import 'package:flutter/material.dart';

int counterA = 0;
int counterB = 0;

class PointerCounter extends StatefulWidget {
  const PointerCounter({super.key});

  @override
  State<PointerCounter> createState() => _PointerCounterState();
}

class _PointerCounterState extends State<PointerCounter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'pointsCounter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsetsDirectional.only(top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team A',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '${counterA}',
                          style: const TextStyle(
                            fontSize: 200,
                          ),
                        ),
                        Container(
                          color: Colors.cyan,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  counterA;
                                  print(counterA++);
                                });
                              },
                              child: const Text(
                                'Add 1 point',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          color: Colors.cyan,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  counterA += counterA + 2;
                                  print(counterA);
                                });
                              },
                              child: const Text(
                                'Add 2 point',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          color: Colors.cyan,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  counterA += counterA + 3;
                                  print(counterA);
                                });
                              },
                              child: const Text(
                                'Add 3 point',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  child: const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    endIndent: 20,
                    indent: 30,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Team B',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${counterB}',
                        style: const TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 200,
                        ),
                      ),
                      Container(
                        color: Colors.cyan,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                counterB++;
                                print(counterB);
                              });
                            },
                            child: const Text(
                              'Add 1 point',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        color: Colors.cyan,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                counterB += counterB + 2;
                                print(counterB);
                              });
                            },
                            child: const Text(
                              'Add 2 point',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        color: Colors.cyan,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                counterB += counterB + 3;
                                print(counterB);
                              });
                            },
                            child: const Text(
                              'Add 3 point',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.cyan,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            counterB = 0;
                            counterA = 0;
                            print('$counterB $counterA');
                          });
                        },
                        child: const Text(
                          'Reset',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
