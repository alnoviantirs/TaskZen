import 'package:todo_apps/models/signup_model.dart';
import 'package:todo_apps/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:todo_apps/ui/home_page.dart';
import 'package:todo_apps/services/api_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 75), // Added space above the "Hey" text
                  Text(
                    'Heey',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      color: Colors.deepPurple, // Adjust color if needed
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Create a New Account !',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple, // Adjust color if needed
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in your full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person,
                          color: Colors.grey), // Change icon color
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Change border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // Change border color when focused
                      ),
                      labelStyle: TextStyle(
                          color: Colors.grey), // Change label text color
                    ),
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 92, 90, 90)),
                  ),

                  SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in your phone number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone,
                          color: Colors.grey), // Change icon color
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Change border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // Change border color when focused
                      ),
                      labelStyle: TextStyle(
                          color: Colors.grey), // Change label text color
                    ),
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 92, 90, 90)),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in your email';
                      } else if (!value.contains('@')) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email,
                          color: Colors.grey), // Change icon color
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Change border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // Change border color when focused
                      ),
                      labelStyle: TextStyle(
                          color: Colors.grey), // Change label text color
                    ),
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 92, 90, 90)),
                  ),

                  SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock,
                          color: Colors.grey), // Change icon color
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Change border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // Change border color when focused
                      ),
                      labelStyle: TextStyle(
                          color: Colors.grey), // Change label text color
                    ),
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 92, 90, 90)),
                  ),

                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Perform registration logic here
                        SignupInput signupInput = SignupInput(
                          FullName: _fullNameController.text,
                          Phonenumber: _phoneController.text,
                          Email: _emailController.text,
                          Password: _passwordController.text,
                        );

                        try {
                          // Call the signup API
                          SignupResponse? signupResponse =
                              await ApiServices().signup(signupInput);

                          if (signupResponse != null &&
                              signupResponse.status == 200) {
                            // Registration successful, navigate to the home page or login page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          } else {
                            // Registration failed, show an error message or handle accordingly
                            // You might want to display an error message to the user
                            // e.g., ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration failed")));
                          }
                        } catch (e) {
                          // Handle API call errors
                          print("Error during registration: $e");
                          // You might want to display an error message to the user
                          // e.g., ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error during registration")));
                        }
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 92, 90,
                                90)), // Change color to your preference
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Or',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle Google sign-in
                        },
                        child: Image.asset(
                          'assets/icons/google.png',
                          height: 60,
                          width: 60,
                        ),
                      ),
                      SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          // Handle Facebook sign-in
                        },
                        child: Image.asset(
                          'assets/icons/facebook.png',
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
