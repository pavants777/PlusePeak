import 'package:flutter/material.dart';

import 'package:fitness/common/color_extension.dart';
import 'package:fitness/view/login/login_page.dart';
import 'package:fitness/view/login/step1_view.dart';

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
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: media.width * 0.3),
            Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TColor.primary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            _buildTextField("Username", _usernameController),
            SizedBox(height: 20),
            _buildTextField("Email", _emailController),
            SizedBox(height: 20),
            _buildTextField("Password", _passwordController, isPassword: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement signup functionality
                // For reference
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
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "I Have An Account?",
                  style: TextStyle(color: TColor.primary),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                        (route) => false);
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
          labelStyle: TextStyle(color: TColor.primary),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TColor.primary),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TColor.primary.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
