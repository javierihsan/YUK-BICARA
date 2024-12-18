import 'package:designprak/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
            "Sign Up",
            style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),

          // Full Name Field
          _buildFieldTitle("Full Name"),
          _buildTextField("Enter Full Name", false), // Tidak menggunakan obscureText
          SizedBox(height: 24),

          // Email Field
          _buildFieldTitle("Email Unair"),
          _buildTextField("Enter Email Unair", false), // Tidak menggunakan obscureText
          SizedBox(height: 24),

          // Password Field
          _buildFieldTitle("Password"),
          _buildTextField("Enter Password", true, obscureText: _obscurePassword, onIconPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          }),
          SizedBox(height: 24),

          // Confirmation Password Field
          _buildFieldTitle("Confirmation Password"),
          _buildTextField("Enter Confirmation Password", true, obscureText: _obscureConfirmPassword, onIconPressed: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          }),
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
              text: "Already have an account? ",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: "Sign In",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/login'); // Navigate to Login page
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
                // Handle Google sign-up
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

  Widget _buildTextField(String hintText, bool isPassword, {bool obscureText = false, VoidCallback? onIconPressed}) {
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                onPressed: onIconPressed,
              )
            : null,
      ),
    );
  }
}
