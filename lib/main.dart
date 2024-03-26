import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scholar',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed(ChatPage.route,
                  arguments: FirebaseAuth.instance.currentUser!.email);
            });
          }
          return const LoginPage();
        },
      ),
      routes: {
        LoginPage.route: (context) => const LoginPage(),
        RegisterPage.route: (context) => const RegisterPage(),
        ChatPage.route: (context) => const ChatPage(),
      },
    );
  }
}
