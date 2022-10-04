import 'package:account_system_test/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:account_system_test/Screens/home_page.dart';
import 'package:account_system_test/services/services.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextStyle _header = const TextStyle(
    color: Colors.deepPurple,
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );
  final TextEditingController _Fullname = TextEditingController();
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _Username = TextEditingController();
  final TextEditingController _Password = TextEditingController();
  final AuthService _authService = AuthService();
  final double _height = 20.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: _header,
                  ),
                  SizedBox(
                    height: _height,
                  ),
                  _TextInput(controller: _Fullname, hint: "Full Name"),
                  SizedBox(
                    height: _height,
                  ),
                  _TextInput(controller: _Email, hint: "Email"),
                  SizedBox(
                    height: _height,
                  ),
                  _TextInput(controller: _Username, hint: "Username"),
                  SizedBox(
                    height: _height,
                  ),
                  _TextInput(controller: _Password, hint: "Password"),
                  SizedBox(
                    height: _height,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _authService
                          .registerFirebaser(_Username.text, _Password.text)
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage())));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        minimumSize: const Size(300, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already Have An Account",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginPage())));
                        }),
                        child: const Text(
                          "Sign Here",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 2.5,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
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
