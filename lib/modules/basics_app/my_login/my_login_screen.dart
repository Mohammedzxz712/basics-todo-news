import 'package:flutter/material.dart';

class MyLoginscreen extends StatelessWidget {
  const MyLoginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 1,
                ),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green.shade300)),
                          hintText: 'Username'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          hintText: 'Password'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12)),
                    height: 60,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2, right: 2),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/image/111650_google-icon_512x512.png',
                            width: 60,
                            height: 60,
                          ),
                        ),
                        const SizedBox(width: 15),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset('assets/image/mac.webp',
                              width: 60, height: 60),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
