import 'package:flutter/material.dart';
import 'package:signup_and_loginpage_localstorage/view/log_in_success/login_successpage.dart';
import 'package:signup_and_loginpage_localstorage/view/signup_page/signup_page.dart';

class SigninPage extends StatefulWidget {
  final String email;
  final String password;
  const SigninPage({super.key, required this.email, required this.password});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _obscureText = true; // To manage the visibility of the password
  bool _checkBox = false; // To check the checking the rememberBox

  // Controllers
  final TextEditingController gmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Global key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.arrow_back),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    // Sign in to your Account
                    const Text(
                      "Sign in to Your Account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Enter your Email Address
                    TextFormField(
                      controller: gmailController,
                      decoration: InputDecoration(
                        label: const Text("Your Email Address"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        fillColor: Colors.grey[100],
                        filled: true,
                      ),

                      // Validating the Email Field
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an email address.";
                        }
                        // Validate email format
                        if (!RegExp(r"^[a-z0-9._%+-]+@gmail\.com$",
                                caseSensitive: false)
                            .hasMatch(value)) {
                          return "Enter a valid Gmail address (e.g., yourname@gmail.com)";
                        }
                        return null; // The input is valid
                      },
                    ),

                    const SizedBox(height: 20),

                    // Your Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        label: const Text("Your Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        fillColor: Colors.grey[100],
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText =
                                  !_obscureText; // Toggle the obscureText value
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),

                      // Validating the Password Field
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password.";
                        }

                        // Regex to check if the value meets all the criteria
                        if (!RegExp(
                                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
                            .hasMatch(value)) {
                          return "Please Enter a Storing Password";
                        }

                        return null; // The input is valid
                      },
                    ),

                    const SizedBox(height: 20),

                    // row for forget password and remember me
                    Row(
                      children: [
                        // Icon box for tick mark
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _checkBox = !_checkBox;
                            });
                          },
                          icon: Icon(_checkBox
                              ? Icons.check_box
                              : Icons.check_box_outline_blank_outlined),
                        ),

                        // Remember me Text
                        const Text("Remember Me"),

                        // long space

                        const Spacer(),

                        // forget password text
                        const Text(
                          "Forget Password ?",
                          style: TextStyle(color: Colors.blue, fontSize: 13),
                        )
                      ],
                    ),

                    // Sign in button

                    const SizedBox(height: 50),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Check if the email and password match the sign-up credentials
                          if (gmailController.text == widget.email &&
                              passwordController.text == widget.password) {
                            // Credentials match, navigate to the LoginSuccessPage
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginSuccessPage(),
                              ),
                            );
                          } else {
                            // Show an error message if credentials don't match
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Invalid email or password."),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    // long space to bottom
                    const SizedBox(height: 250),

                    // bottom text

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an Account?",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),

                        const SizedBox(width: 10),

                        // signup nativation text
                        InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              )),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
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
}
