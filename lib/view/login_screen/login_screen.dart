import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token_test/controller/login_screen_controller.dart';
import 'package:token_test/global_widgets/custom_textfield.dart';
import 'package:token_test/global_widgets/refactored_button.dart';
import 'package:token_test/main.dart';
import 'package:token_test/view/home_screen/home_screen.dart';
import 'package:token_test/view/registration_screen/registration_screen.dart'; // Import the registration screen

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/login_img.jpg"),
              CustomTextField(
                controller: emailController,
                label: "Email",
                keyboardType:
                    TextInputType.emailAddress, // Optional, for email input
              ),
              CustomTextField(
                controller: passwordController,
                label: "Password",
                obscureText: true,
              ),
              SizedBox(height: 20),
              Consumer<LoginScreenController>(
                builder: (context, providerObj, child) => providerObj.isLoading
                    ? CircularProgressIndicator()
                    : RefactoredButton(
                        label: "Login",
                        onTap: () async {
                          // Implement login logic here

                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            // funciton to execute login
                            await context
                                .read<LoginScreenController>()
                                .onLogin(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then(
                              (value) {
                                // value true means login success
                                if (value == true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text("Login Success")));
                                  // on login navigate to home screen
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  );
                                }
                              },
                            );
                          } else {
                            // on empty email or pass show a snackbar
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Enter valid credentials")));
                          }
                        },
                      ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RegistrationScreen()), // Navigate to RegisterScreen
                  );
                },
                child: Text("Don't have an account? Register now"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
