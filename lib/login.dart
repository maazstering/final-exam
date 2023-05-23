import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_exam/home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset('assets/images/bg.jpg',
              fit: BoxFit.cover, height: MediaQuery.of(context).size.height),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.4,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              final User? user =
                                  (await _auth.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              ))
                                      .user;
                              if (!user!.emailVerified) {
                                await user.sendEmailVerification();
                              }
                              // Navigate to /data page
                              Navigator.of(context)
                                  .pushReplacementNamed('/crud');
                            } on FirebaseAuthException catch (e) {
                              print('Failed with error code: ${e.code}');
                              print(e.message);
                            }
                          },
                          child: Text("Login"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
