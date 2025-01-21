import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarteco/view/screens/Welcome.dart';
import 'package:smarteco/view/screens/login.dart';
import 'package:smarteco/view/screens/signup.dart';
import 'package:smarteco/viewmodels/signup_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:
    [ChangeNotifierProvider(create: (_)=> SignupViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/welcome',
        routes: {
          '/login' : (context) => LoginScreen(),
          '/signup' : (context) => SignupScreen(),
          '/welcome' : (context) => WelcomeScreen(),
        },
        //home: SignupScreen(),
      ),
    );
  }
}