import 'package:flutter/material.dart';

/* 
Authored by: Irene Artiaga, Frances Yvonne Madera, Marijoe San Juan
Company: FurBnB&Co.
Project: FurBnb - Pet Sitting Services
Feature: [FBN-001] Home Screen and Registration/Login Flow
Description: This feature provides the home screen with options for pet owners and sitters to register or login. It includes navigation to the Registration and Login screens.
*/

void main() {
  runApp(MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FurBnb - Pet Sitting Services',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

/* 
Authored by: Irene Artiaga, Frances Yvonne Madera, Marijoe San Juan
Company: FurBnB&Co.
Project: FurBnb - Pet Sitting Services
Feature: [FBN-002] Home Screen
Description: This screen is the landing page of the app, where users can navigate to sign up as a pet owner or sitter, login, or reset their password.
*/
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to FurBnb!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Find Your Purrfect Match Today!🐾',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: 40),

              // Pet Owner Registration Button
              _buildActionButton(
                context,
                'Sign Up as Pet Owner',
                Colors.blue,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RegistrationScreen(role: 'Pet Owner')),
                  );
                },
              ),
              SizedBox(height: 20),

              // Pet Sitter Registration Button
              _buildActionButton(
                context,
                'Sign Up as Pet Sitter',
                Colors.green,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RegistrationScreen(role: 'Pet Sitter')),
                  );
                },
              ),
              SizedBox(height: 20),

              // Login Button
              _buildActionButton(
                context,
                'Login',
                Colors.orange,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              SizedBox(height: 20),

              // Forgot Password Link
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build action buttons
  Widget _buildActionButton(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

/* 
Authored by: Irene Artiaga, Frances Yvonne Madera, Marijoe San Juan
Company: FurBnB&Co.
Project: FurBnb - Pet Sitting Services
Feature: [FBN-003] Registration Screen
Description: This screen allows users (pet owners or sitters) to register by providing their name, email, and password.
*/
class RegistrationScreen extends StatefulWidget {
  final String role;

  RegistrationScreen({required this.role});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle registration action
  void _register() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    print(
        'Role: ${widget.role}, Name: $name, Email: $email, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register as ${widget.role}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

/* 
Authored by: Irene Artiaga, Frances Yvonne Madera, Marijoe San Juan
Company: FurBnB&Co.
Project: FurBnb - Pet Sitting Services
Feature: [FBN-004] Login Screen
Description: This screen allows users to log in using their email and password.
*/
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle login action
  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    print('Login attempt: Email: $email, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

/* 
Authored by: Irene Artiaga, Frances Yvonne Madera, Marijoe San Juan
Company: FurBnB&Co.
Project: FurBnb - Pet Sitting Services
Feature: [FBN-005] Forgot Password Screen
Description: This screen allows users to reset their password by entering their email.
*/
class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter your email to reset password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Password reset request sent.');
                Navigator.pop(context);
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
