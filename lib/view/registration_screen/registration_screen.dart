import 'package:flutter/material.dart';
import 'package:token_test/global_widgets/custom_textfield.dart';
import 'package:token_test/global_widgets/refactored_button.dart';
import 'package:token_test/view/login_screen/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              label: "Name",
            ),
            CustomTextField(
              controller: phoneController,
              label: "Phone",
            ),
            CustomTextField(
              controller: placeController,
              label: "Place",
            ),
            CustomTextField(
              controller: pincodeController,
              label: "Pincode",
            ),
            CustomTextField(
              controller: emailController,
              label: "Email",
              keyboardType: TextInputType.emailAddress, // For email input
            ),
            CustomTextField(
              controller: passwordController,
              label: "Password",
            ),
            SizedBox(height: 20),
            RefactoredButton(
              label: "Register",
              onTap: () {
                // Implement registration logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // navigate back to login screen
              },
              child: Text("Alredy have an account? LOGIN Now"),
            ),
          ],
        ),
      ),
    );
  }
}
