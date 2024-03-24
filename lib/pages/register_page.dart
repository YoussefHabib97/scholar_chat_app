import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_app/pages/login_page.dart';
import 'package:scholar_chat_app/widgets/custom_button.dart';
import 'package:scholar_chat_app/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const String route = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    late String email, password;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
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
                  CustomTextField(
                    onChanged: (value) {
                      email = value!;
                    },
                    labelText: 'Email',
                    hintText: 'example@domain.com',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return password = value;
                    },
                    labelText: 'Password',
                    hintText: 'Enter at least 7 characters',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  CustomButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {}
                      try {
                        await registerUser(email, password);
                      } on FirebaseAuthException catch (e) {
                        showSnackBar(context, e);
                      } catch (e) {
                        showSnackBar(context, e);
                      }
                    },
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
      ),
    );
  }

  void showSnackBar(BuildContext context, dynamic e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
  }

  Future<void> registerUser(String email, String password) async {
    final auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
