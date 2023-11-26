import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_mate/views/logo_animation.dart';
import 'package:health_mate/views/theme_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // Initialize the ThemeProvider
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) => MaterialApp(
          title: 'Flutter Firebase Chat',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData, // Use the theme from ThemeProvider
          home: const LogoAnimation(),
        ),
      ),
    );
  }
}
