import 'package:flutter/material.dart';
import 'package:feet_locker/menu.dart';
import 'package:feet_locker/add_product_page.dart';

void main() {
  runApp(const FeetLockerApp());
}

class FeetLockerApp extends StatelessWidget {
  const FeetLockerApp({super.key});

  @override
  Widget build(BuildContext context) {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,      
      onPrimary: Colors.white,     
      secondary: Colors.black87,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,       
      onSurface: Colors.black,
    );

    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.background,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 20,
          letterSpacing: .2,
        ),
      ),

      cardTheme: CardThemeData(
        color: scheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.black12),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black26),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black26),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),
        labelStyle: const TextStyle(color: Colors.black87),
        hintStyle: const TextStyle(color: Colors.black45),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      listTileTheme: const ListTileThemeData(
        iconColor: Colors.black,
        textColor: Colors.black,
      ),

      dividerColor: Colors.black12,
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );

    return MaterialApp(
      title: 'Feet Locker',
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/add-product': (context) => const AddProductPage(),
      },
    );
  }
}
