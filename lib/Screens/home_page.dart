import 'package:flutter/material.dart';
import 'package:account_system_test/Screens/login_page.dart';
import 'package:account_system_test/Screens/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: const Text(
                        'Click here for Sign Up Page',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 30,
                          ),
                      )),
                      Text(
                        "Or",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      ),
                TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: const Text(
                        'Click here for Sign In Page',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 30,
                          ),
                      )),

                ],
        ),
      ),
    );
  }
}