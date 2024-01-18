import 'package:TranquilApp/screens/login_screen.dart';
import 'package:TranquilApp/utils/global.colors.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _isObscurePassword = true;
  final _isObscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            // padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'lib/assets/logo_blue.png',
                  height: 72,
                  width: 72,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    "Already have an account? Sign in",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 20.0),
                const TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20.0),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.all(0), // Adjust padding as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 10, // Adjust elevation as needed
                    backgroundColor: GlobalColors.mainColor, // Button color
                    foregroundColor: Colors.white, // Text color
                    shadowColor: Colors.black.withOpacity(0.1),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  '- OR -',
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(children: [
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        height: 55,
                        decoration: BoxDecoration(
                            color: GlobalColors.mainColor,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 10,
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'lib/assets/google.png',
                              height: 30,
                            ),
                            const Text(
                              'Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
