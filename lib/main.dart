import 'package:flutter/material.dart';
import 'package:feet_locker/screens/login_page.dart';
import 'package:feet_locker/screens/menu_page.dart';
import 'package:feet_locker/screens/add_product_page.dart';
import 'package:feet_locker/screens/product_list_page.dart';
import 'package:feet_locker/utils/constants.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FeetLockerApp());
}

class FeetLockerApp extends StatelessWidget {
  const FeetLockerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.light(
      primary: kPrimaryColor,
      onPrimary: Colors.white,
      secondary: kSecondaryColor,
      onSecondary: kTextPrimaryColor,
      background: kBackgroundColor,
      onBackground: kTextPrimaryColor,
      surface: kSurfaceColor,
      onSurface: kTextPrimaryColor,
    );

    return Provider(
      create: (_) => CookieRequest(),
      child: MaterialApp(
        title: 'Feet Locker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme,
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: ThemeData.light()
              .textTheme
              .apply(bodyColor: kTextPrimaryColor, displayColor: kTextPrimaryColor),
          appBarTheme: const AppBarTheme(
            backgroundColor: kDarkSurfaceColor,
            foregroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          cardTheme: CardThemeData(
            color: kSurfaceColor,
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: kAccentBorderColor),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kAccentBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kAccentBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kPrimaryColor, width: 1.4),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.w600),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: kPrimaryColor,
              textStyle: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: kPrimaryColor,
            contentTextStyle: TextStyle(color: Colors.white),
          ),
        ),
        home: const LoginPage(),
        routes: {
          '/menu': (context) => MenuPage(),
          '/add-product': (context) => const AddProductPage(),
          '/products': (context) => const ProductListPage(),
        },
      ),
    );
  }
}
