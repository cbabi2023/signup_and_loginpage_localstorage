import 'package:flutter/material.dart';
import 'package:signup_and_loginpage_localstorage/view/signin_homescreen/signin_page.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SigninPage(email: '', password: ''),
              ));
        },
        child: Icon(Icons.exit_to_app),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Login Success"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Center(
                    child: Icon(
                      Icons.person_add,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: const Text(
                      "Welcome, you have successfully logged in!",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
