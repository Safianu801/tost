import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast_mobile/services/authentication_service.dart';
import 'package:toast_mobile/services/user_provider.dart';

import 'features/intro/screens/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthenticationService(),
        child: Consumer<AuthenticationService>(
          builder: (context, auth, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Toast Mobile',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: const SplashScreen()),
        ));
  }
}
