import 'package:designprak/homePage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232528),
      appBar: AppBar(
        backgroundColor: Color(0xFF232528),
        automaticallyImplyLeading: false,
        elevation: 0, 
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Logo
          Center(
            child: Image.asset(
              'assets/yukbicaralogo.png',
              height: 100,
            ),
          ),
          SizedBox(height: 20),

          Text(
            "Sign In",
            style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),

          // Email Field with Title
          _buildFieldTitle("Email Unair"),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Email Unair",
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFF1E1E1E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 24),

          // Password Field with Title
          _buildFieldTitle("Password"),
          TextFormField(
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: "Enter Password",
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFF1E1E1E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 16),

          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: "Create Account",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/signup');
                    },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Or",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Google Sign-In Button
          Center(
            child: GestureDetector(
              onTap: () {
                // Handle Google Sign-In
              },
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey[850],
                child: Image.network(
                  'https://www.pngmart.com/files/16/official-Google-Logo-PNG-Image.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to create titles for text fields
  Widget _buildFieldTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
