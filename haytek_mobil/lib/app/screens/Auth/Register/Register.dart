import 'package:flutter/material.dart';
import 'package:haytek_mobil/app/config/colors.dart';
import 'package:haytek_mobil/app/models/user_model.dart';
import 'package:haytek_mobil/app/screens/Auth/Login/Login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:haytek_mobil/app/providers/user_provider.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen bir email adresi girin';
    }
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) {
      return 'Geçerli bir email adresi girin';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back,
                            color: HexColor(buttomColor),
                            size: 30,
                          )),
                    ]),
                    const SizedBox(height: 40),
                    const Text("Create Account",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold)),
                    Text("Create a new  account",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400])),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        controller: _nameController,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              size: 30,
                            ),
                            labelText: "Name",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextFormField(
                        controller: _emailController,
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
                        validator: _emailValidator,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        controller: _phoneController,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.phone,
                              size: 30,
                            ),
                            labelText: "Phone",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        controller: _passwordController,
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
                    Container(
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 30,
                            ),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final userProvider = Provider.of<UserProvider>(
                              context,
                              listen: false,
                            );
                            final newUser = UserModel()
                              ..name = _nameController.text
                              ..email = _emailController.text
                              ..phone = _phoneController.text
                              ..password = _passwordController.text;

                            userProvider.addUser(newUser);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            HexColor(buttomColor), // Buton
                          ),
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white), // Yazı rengi beyaz
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account ",
                          style: TextStyle(fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login())),
                          child: Text(
                            "Login ",
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
      ),
    );
  }
}
