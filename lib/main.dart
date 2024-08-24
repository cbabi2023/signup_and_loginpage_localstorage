import 'package:flutter/material.dart';
import 'package:signup_and_loginpage_localstorage/view/signin_homescreen/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SigninPage(email: '', password: '',),
    );
  }
}
