import 'package:fitness/view/login/step1_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness/common/color_extension.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: media.width * 0.2,
            ),
            SizedBox(height: 70),
            Text(
              "Sign In",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TColor.primary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            _buildTextField("Email", _emailController),
            const SizedBox(
              height: 50,
            ),
            _buildTextField("Password", _passwordController, isPassword: true),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                // Implement sign-in functionality
                // just for reference

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Step1View()),
                    (route) => false);
              },
              child: Text("Sign In"),
            ),
            SizedBox(height: 20),
            Text(
              "------OR------",
              style: TextStyle(
                color: TColor.primary,
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
                  "Don't have an account?",
                  style: TextStyle(color: TColor.primary),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the sign-up page
                    Navigator.pop(context);
                  },
                  child: const Text(
                    ' Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              ],
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
