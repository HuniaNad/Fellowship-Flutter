import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  String password = "";

  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 500,
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                      left: 235,
                      top: -18,
                      child: Container(
                        width: 398,
                        height: 398,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(149, 99, 255, 1)),
                      ),
                    ),
                    Positioned(
                      left: -184,
                      top: -412,
                      child: Container(
                        width: 700,
                        height: 700,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(19, 19, 19, 1),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                            right: 80,
                            bottom: 44,
                          ),
                          alignment: Alignment.bottomCenter,
                          child: const Text(
                            "Welcome\nBack",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 45),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -163,
                      top: -292,
                      child: Container(
                        width: 398,
                        height: 398,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 189, 92, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //email
              inputEmail(),
              //password
              inputPassword(),
              //login
              Container(
                width: 120,
                height: 40,
                margin: const EdgeInsets.only(left: 130),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(19, 19, 19, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
                ),
              ),

              //sign up & forgot password
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Card(
                      margin: EdgeInsets.only(top: 80),
                      color: Color.fromRGBO(149, 99, 255, 1),
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(top: 80),
                      color: Color.fromRGBO(255, 189, 92, 1),
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputPassword() => Container(
        width: 303,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: TextField(
          onChanged: (value) => setState(() => this.password=value),
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Password',
            suffixIcon: passwordController.text.isEmpty
                ? Container(width: 0)
                : IconButton(
                    onPressed: () => setState(() =>
                      isPasswordVisible = !isPasswordVisible
                    ),
                    icon: isPasswordVisible
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  ),
            iconColor: const Color.fromRGBO(149, 99, 255, 1),
            
          ),
          obscureText: isPasswordVisible,
        ),
      );

  Widget inputEmail() => Container(
        width: 303,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Your Email',
              suffixIcon: emailController.text.isEmpty
                  ? Container(width: 0)
                  : IconButton(
                      onPressed: () => emailController.clear(),
                      icon: const Icon(Icons.clear),
                    ),
              suffixIconColor: const Color.fromRGBO(149, 99, 255, 1),
            ),
          ),
        ),
      );
}
