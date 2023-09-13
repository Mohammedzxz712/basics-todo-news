import 'package:flutter/material.dart';

class MyNewPathScreen extends StatelessWidget {
  const MyNewPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Image.asset(
              'assets/image/menuu.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Discover a New Path',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      color: Colors.white,
                      height: 50,
                      child: TextFormField(
                        style: const TextStyle(),
                        decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            prefix: Icon(Icons.search, color: Colors.black),
                            hintText: 'Search for a job'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
