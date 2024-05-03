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
                  SizedBox(height: 70),
                  Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.primaryText,
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
                  _buildTextField("Password", _passwordController,
                      isPassword: true),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement sign-in functionality
                      // just for reference

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Step1View()));
                    },
                    child: Text("Sign In"),
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
                      const Text("Don't have an account?"),
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
                      color: 2 == pObj
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
