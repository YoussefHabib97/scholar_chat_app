import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat_app/cubits/register_cubit/register_cubit.dart';
import 'package:scholar_chat_app/helpers/show_snack_bar.dart';
import 'package:scholar_chat_app/pages/chat_page.dart';
import 'package:scholar_chat_app/pages/login_page.dart';
import 'package:scholar_chat_app/widgets/custom_button.dart';
import 'package:scholar_chat_app/widgets/custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  static const String route = 'register';

  final GlobalKey<FormState> _formKey = GlobalKey();

  String? email, password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.of(context).pushReplacementNamed(
            ChatPage.route,
            arguments: email,
          );
        } else if (state is RegisterFailure) {
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
                            BlocProvider.of<RegisterCubit>(context)
                                .registerUser(
                              email: email!,
                              password: password!,
                            );
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
      ),
    );
  }
}
