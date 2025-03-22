import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../main.dart';

import 'inscription5.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true; // Toggles password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Allows the screen to scroll if the content is large
        child: Column(
          children: [
            // 1) Top Image
            Container(
              height: 400, // Adjust as needed
              width: double.infinity,
              child: Image.asset(
                'assets/1404bf94e1cee9f5066fce0a068c4cc0.jfif', // Update with your asset name
                fit: BoxFit.cover,
              ),
            ),

            // 2) Rounded White Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    'Bienvenue',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF396C9B),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Email / Phone TextField
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFA3C3E4),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email ou Numero de telephone",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF396C9B),
                          ),
                        ),

                        SizedBox(height: 16),

                        TextField(
                          // Toggles hiding/showing password
                          decoration: InputDecoration(
                            hintText: "Email ou Numero de telephone",
                            // Make background gray and fill the entire shape
                            fillColor: Colors.grey[300],
                            filled: true,
                            // Remove default border and make corners fully rounded
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            // Control the space inside the text field
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),

                            // The icon on the right to toggle password visibility
                          ),
                        ),
                        SizedBox(height: 16),
                        // Password TextField
                        Text(
                          "Mot de passe",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF396C9B),
                          ),
                        ),

                        SizedBox(height: 16),

                        TextField(
                          obscureText:
                              _obscureText, // Toggles hiding/showing password
                          decoration: InputDecoration(
                            hintText: "Entrer Votre mot de passe",
                            // Make background gray and fill the entire shape
                            fillColor: Colors.grey[300],
                            filled: true,
                            // Remove default border and make corners fully rounded
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            // Control the space inside the text field
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                            // The icon on the right to toggle password visibility
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText =
                                      !_obscureText; // Toggle between true/false
                                });
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: 16),
                        Center(
                          child: SizedBox(
                            //   width: double.infinity,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: Implement login logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF396C9B),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: const Text(
                                'Connexion',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Forgot Password
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // TODO: Navigate to "Mot de passe oublié?" screen
                            },
                            child: const Text(
                              'Mot de passe oublié ?',
                              style: TextStyle(color: Color(0xFF396C9B)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
