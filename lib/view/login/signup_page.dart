import 'package:fitness/view/login/login_page.dart';
import 'package:fitness/view/login/step1_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness/common/color_extension.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            Image.asset(
              'assets/img/on_board_bg.png',
              width: media.width,
              height: media.height,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField("Username", _usernameController),
                  SizedBox(height: 20),
                  _buildTextField("Email", _emailController),
                  SizedBox(height: 20),
                  _buildTextField("Password", _passwordController,
                      isPassword: true),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement signup functionality
                      // just for refrence
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Step1View()));
                    },
                    child: Text("Sign Up"),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "------OR------",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("I Have An Account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                        },
                        child: const Text(
                          ' Log In',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/img/01.webp',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/img/download (1).png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2].map((pObj) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: 1 == pObj
                          ? TColor.white
                          : TColor.gray.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: TColor.primaryText),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TColor.primaryText),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TColor.primaryText.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
