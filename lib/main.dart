import 'package:flutter/material.dart';
import 'package:feet_locker/menu.dart'; 

void main() {
  runApp(const FeetLockerApp());
}

class FeetLockerApp extends StatelessWidget {
  const FeetLockerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent[400]),
        useMaterial3: false, 
      ),
      home: MyHomePage(), 
      debugShowCheckedModeBanner: false,
    );
  }
}
