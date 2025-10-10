import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mind/account/singup.dart';
import 'package:mind/intro.dart';

class Login extends StatefulWidget {
  

   Login({super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login(String email,String password)async{
    try{
         await _auth.createUserWithEmailAndPassword(
          email: email,
           password: password
           );
          ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Login Successful 🎉',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          duration: Duration(seconds: 2),
        ),
      );


    }on FirebaseAuthException catch(error){
      print('error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            
            Image.asset(
              'assets/login1.png', 
              height: 200,
              width: 200,
            ),

            
            Image.asset(
              'assets/logo.png', 
              height: 100,
              width: 100,
            ),

            const SizedBox(height: 10),

            // White Login Container
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Center(
                      child: Text(
                        "Log In",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Email
                    const Text("Email"),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Password
                    const Text("Password"),
                    const SizedBox(height: 5),
                    ValueListenableBuilder(
                      valueListenable: toggle,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 7) {
                              return 'Password must be at least 7 characters';
                            }
                            return null;
                          },
                          obscureText: !toggle.value,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                toggle.value = !toggle.value;
                              },
                              child: Icon(toggle.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 10),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Login Button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {

                          if (formkey.currentState!.validate()) {
                            login(emailcontroller.text, passwordcontroller.text);
                               Navigator.push(context, 
            MaterialPageRoute(builder: (context)=>Intropage()));
            SnackBar(
              backgroundColor: Colors.lightGreenAccent,
              content: Text('login successfully',style: TextStyle(fontSize: 
              20,fontWeight: FontWeight.w900,color: Colors.white),));


                            print('Login successful ✅');
                          }
                        },
                        child: const Text("Log In"),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Signup Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Singup()));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
