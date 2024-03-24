import 'package:flutter/material.dart';
import 'package:scholar_chat_app/pages/register_page.dart';
import 'package:scholar_chat_app/widgets/custom_button.dart';
import 'package:scholar_chat_app/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String route = 'login';

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
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                CustomTextField(
                  onChanged: (value) {},
                  labelText: 'Email',
                  hintText: 'example@domain.com',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                CustomTextField(
                  onChanged: (value) {},
                  labelText: 'Password',
                  hintText: 'Enter at least 7 characters',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                CustomButton(
                  onPressed: () {},
                  buttonText: "Login",
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Dont have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterPage.route);
                      },
                      child: const Text("Register here"),
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
