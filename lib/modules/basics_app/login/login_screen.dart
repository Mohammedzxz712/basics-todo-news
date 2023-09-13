import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password must required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email addresse',
                          prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password must required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultButton(
                        function: () {
                          print(emailController.text);
                          print(passwordController.text);
                        },
                        text: 'login'),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'don\'n have an account?',
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text('Register Now'))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
