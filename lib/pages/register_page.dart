import 'package:flutter/material.dart';
import 'package:scholar_chat_app/pages/login_page.dart';
import 'package:scholar_chat_app/widgets/custom_button.dart';
import 'package:scholar_chat_app/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String route = 'register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/scholar.png'),
                const Text(
                  "Scholar Chat",
                  style: TextStyle(
                    fontFamily: 'pacifico',
                    fontSize: 32,
                  ),
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const CustomTextField(
                  labelText: 'Email',
                  hintText: 'example@domain.com',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                const CustomTextField(
                  labelText: 'Password',
                  hintText: 'Enter at least 7 characters',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                CustomButton(
                  onPressed: () {},
                  buttonText: "Register",
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginPage.route);
                      },
                      child: const Text("Login here"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
