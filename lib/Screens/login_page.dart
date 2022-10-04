import 'package:flutter/material.dart';
import 'package:account_system_test/Screens/register_page.dart';
import 'package:account_system_test/Screens/home_page.dart';
import 'package:account_system_test/services/services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextStyle _header = const TextStyle(
      color: Colors.deepPurple,
      fontSize: 35,
      fontWeight: FontWeight.bold,
      );
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final AuthService _authService = AuthService();
  final double _height = 20.0;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (
          Center(
              key: _formkey,
              child:  Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
             
              children: <Widget>[
                Text(
                  'Sign In',
                  style: _header,
                ),
                SizedBox(
                  height: _height,
                ),
                _TextInput(controller: _username, hint: 'Username'),
                SizedBox(
                  height: _height,
                ),
                _TextInput(controller: _password, hint: 'Password'),
                SizedBox(
                  height: _height * 2,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _authService
                          .loginFirebaser(_username.text, _password.text)
                          .then((value) => Navigator.push(
                              context,
                               MaterialPageRoute(
                                builder: (context)  => const HomePage())));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        minimumSize: const Size(300, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                ),
               
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        )),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 150),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
                SizedBox(height: 30),
                TextButton(
                    onPressed: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
              )),
        
        ),
    );
  }
}

class _TextInput extends StatelessWidget {
  const _TextInput({Key? key, required this.controller, required this.hint});

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        border: UnderlineInputBorder(),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
