import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:recipe/Provider/favorite_provider.dart';
import 'package:recipe/Provider/quantity.dart';
import 'Views/app_main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // for favorite provider
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        // for quantity provider
        ChangeNotifierProvider(create: (_) => QuantityProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppMainScreen(),
      ),
    );
  }
}
