import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat_app/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat_app/helpers/show_snack_bar.dart';
import 'package:scholar_chat_app/pages/chat_page.dart';
import 'package:scholar_chat_app/pages/register_page.dart';
import 'package:scholar_chat_app/widgets/custom_button.dart';
import 'package:scholar_chat_app/widgets/custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const String route = 'login';

  final GlobalKey<FormState> _formKey = GlobalKey();

  String? email, password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.of(context).pushReplacementNamed(
            ChatPage.route,
            arguments: email,
          );
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      child: ModalProgressHUD(
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
                        "Login",
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
                            BlocProvider.of<LoginCubit>(context).loginUser(
                              email: email!,
                              password: password!,
                            );
                          }
                        },
                        buttonText: "Login",
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(RegisterPage.route);
                            },
                            child: const Text("Register"),
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
      ),
    );
  }

  Future<void> loginUser(String email, String password) async {
    final auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
