import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat_app/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat_app/cubits/register_cubit/register_cubit.dart';
import 'package:scholar_chat_app/firebase_options.dart';
import 'package:scholar_chat_app/pages/chat_page.dart';
import 'package:scholar_chat_app/pages/login_page.dart';
import 'package:scholar_chat_app/pages/register_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScholarChat();
  }
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scholar',
        initialRoute: LoginPage.route,
        routes: {
          LoginPage.route: (context) => LoginPage(),
          RegisterPage.route: (context) => RegisterPage(),
          ChatPage.route: (context) => ChatPage(),
        },
      ),
    );
  }
}
