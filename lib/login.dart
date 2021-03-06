// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:schoolsys/parenthome/prthome.dart';
import 'package:schoolsys/registration/rgstr.dart';
// ignore: unused_import
import 'package:schoolsys/studenthome/stdhome.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool viewPassword = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 400,
                      child: Image.asset(
                        'assets/login.png',
                      ),
                    ),
                    TextFormField(
                      controller: email,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Enter Your Email!");
                        }
                        if (!RegExp(
                                r"^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$")
                            .hasMatch(value)) {
                          return ("Enter A Valid Email");
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.blue.shade100,
                        filled: true,
                        hintText: 'Email',
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onSaved: (value) {
                        email.text = value!;
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      controller: password,
                      obscureText: viewPassword,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            child: viewPassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onTap: () {
                              setState(() {
                                viewPassword = !viewPassword;
                              });
                            }),
                        fillColor: Colors.blue.shade100,
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(
                            r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{6,20}$");

                        if (value!.isEmpty) {
                          return ("Password Is Required For Login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password");
                        }
                      },
                      onSaved: (value) {
                        password.text = value!;
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 130.0,
                            height: 50.0,
                            child:
                                // ignore: deprecated_member_use
                                RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              color: Colors.blue.shade500,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const StdHome(
                                                title: 'SchooSYS',
                                              )));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Rgstr()));
                      },
                      child: Text.rich(
                        TextSpan(
                            text: 'Don\'t have an account ?',
                            style: const TextStyle(fontSize: 15.0),
                            children: [
                              TextSpan(
                                text: ' Register here',
                                style: TextStyle(
                                    color: Colors.blue.shade500,
                                    fontSize: 15.0),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
