import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scholar_chat_app/helpers/show_snack_bar.dart';
import 'package:scholar_chat_app/pages/login_page.dart';
import 'package:scholar_chat_app/widgets/custom_button.dart';
import 'package:scholar_chat_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const String route = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String? email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                    CustomTextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      labelText: 'Email',
                      hintText: 'example@domain.com',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    CustomTextFormField(
                      onChanged: (value) {
                        return password = value;
                      },
                      labelText: 'Password',
                      hintText: 'Enter at least 6 characters',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    CustomButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await registerUser(email!, password!);
                            showSnackBar(
                              context,
                              'User registered successfully.',
                            );
                          } on FirebaseAuthException catch (e) {
                            showSnackBar(context, e);
                          } catch (e) {
                            showSnackBar(context, e);
                          }
                          setState(() {
                            isLoading = false;
                          });
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
