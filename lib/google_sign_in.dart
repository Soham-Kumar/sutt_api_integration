import 'package:flutter/material.dart';
import 'station_input.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  googleLogin() async {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in with Google'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Google Sign in'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ));
          },
        ),
      ),
    );
  }
}