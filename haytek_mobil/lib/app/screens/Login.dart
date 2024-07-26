import 'package:flutter/material.dart';
import 'package:haytek_mobil/constants/colors.dart';
import 'package:haytek_mobil/screens/Register.dart';
import 'package:haytek_mobil/screens/forget_screen.dart';
import 'package:haytek_mobil/screens/home_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Icon(Icons.person_outlined,
                      color: Colors.grey[300], size: 100),
                  const SizedBox(height: 13),
                  const Text("Welcome to Haytek Management",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("Sign in to continue",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400])),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.mail,
                            size: 30,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 30,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgetPassword()));
                      },
                      child: Text("Forgot password",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HexColor(appBar_backgroundColor))),
                    )
                  ]),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          HexColor(buttomColor), // Buton rengi
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style:
                            TextStyle(color: Colors.white), // Yazı rengi beyaz
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account ",
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () => const Register(),
                        child: Text(
                          "Register ",
                          style: TextStyle(
                              color: HexColor(buttomColor),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
