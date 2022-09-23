import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoggedInScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final node1 = FocusNode();
  final node2 = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
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

              Column(
                children: [
                  //email
                  inputEmail(),
                  //password
                  inputPassword(),
                ],
              ),

              //login
              Container(
                width: 130,
                height: 40,
                margin: const EdgeInsets.only(left: 130),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(19, 19, 19, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    print("Email: " + email + "\nPassword: " + password);
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: const [
                        Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 1)),
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
                ),
              ),

              //sign up & forgot password
              SizedBox(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 32,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(149, 99, 255, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextButton(
                        onPressed: (() {
                          print("Sign up");
                        }),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 32,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 189, 92, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextButton(
                        onPressed: (() {
                          print("Forgot Password");
                        }),
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
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

  Widget inputEmail() => Container(
        width: 330,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: TextField(
          focusNode: node1,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            filled: true,
            fillColor: const Color.fromRGBO(0, 0, 0, 0.1),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  width: 0, color: Color.fromRGBO(0, 0, 0, 0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  width: 0, color: Color.fromRGBO(0, 0, 0, 0.1)),
            ),
            hintText: 'Your Email',
            hintStyle: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              fontSize: 15,
            ),
            suffixIcon: emailController.text.isEmpty
                ? Container(width: 0)
                : IconButton(
                    onPressed: () => emailController.clear(),
                    icon: const Icon(Icons.clear),
                  ),
          ),
          style: const TextStyle(fontSize: 14),
          onChanged: (value) => setState(
            () {
              email = value;
            },
          ),
          onSubmitted: (value) => setState(
            () {
              email = value;
            },
          ),
        ),
      );

  Widget inputPassword() => Container(
        width: 330,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: TextField(
          focusNode: node2,
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            filled: true,
            fillColor: const Color.fromRGBO(0, 0, 0, 0.1),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  width: 0, color: Color.fromRGBO(0, 0, 0, 0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  width: 0, color: Color.fromRGBO(0, 0, 0, 0.1)),
            ),
            hintText: 'Password',
            hintStyle: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              fontSize: 15,
            ),
            suffixIcon: isPasswordVisible
                ? IconButton(
                    onPressed: () => setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    }),
                    icon: const Icon(Icons.visibility_off),
                  )
                : IconButton(
                    onPressed: () => setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    }),
                    icon: const Icon(Icons.visibility),
                  ),
          ),
          style: const TextStyle(fontSize: 14),
          obscureText: isPasswordVisible,
          onChanged: (value) => setState(
            () {
              password = value;
            },
          ),
          onSubmitted: (value) => setState(
            () {
              password = value;
            },
          ),
        ),
      );
}

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              SafeArea(
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Image.asset("assets/images/RoleSelection.png"),
                    ),
                    const SizedBox(height: 30),
                    const SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Who are you?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        width: 250,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(19, 19, 19, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            print("I am Proprietor");
                          },
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(20),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            child: Text(
                              "Proprietor",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(19, 19, 19, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          print("I am Renter");
                        },
                        style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Renter",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -430,
                right: -50,
                child: Container(
                  height: 500,
                  width: 500,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 189, 92, 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
