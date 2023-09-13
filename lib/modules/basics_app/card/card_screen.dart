import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2B475E),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 95,
                      backgroundImage: AssetImage('imaages/Mohammed.jpg'),
                    ),
                  ),
                  const SizedBox(
                    child: Text(
                      'Mohammed Abdullah',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(19),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone),
                          hintText: '(+02) 1553987674',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19, right: 19),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.mail),
                          hintText: 'Mohammed@gmail.com',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
