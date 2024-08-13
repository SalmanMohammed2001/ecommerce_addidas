import 'package:ecommerce_addidas/provider/admin_provider.dart';
import 'package:ecommerce_addidas/provider/auth_provider.dart';
import 'package:ecommerce_addidas/provider/cart_provider.dart';
import 'package:ecommerce_addidas/provider/main_screen_provider.dart';
import 'package:ecommerce_addidas/provider/profile_provider.dart';
import 'package:ecommerce_addidas/provider/signin_provider.dart';
import 'package:ecommerce_addidas/provider/signup_provider.dart';
import 'package:ecommerce_addidas/screen/splach_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SignupProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SignInProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthProviders(),
      ),
      ChangeNotifierProvider(
        create: (context) => MainScreenProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProfileProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AdminProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
