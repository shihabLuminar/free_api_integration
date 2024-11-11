import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token_test/controller/login_screen_controller.dart';
import 'package:token_test/view/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginScreenController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: SplashScreen(),
      ),
    );
  }
}
