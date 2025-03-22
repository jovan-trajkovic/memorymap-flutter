import 'package:flutter/material.dart';
import 'package:memory_map/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      darkTheme: ThemeData.dark(),
      routerConfig: router,
      title: 'Memory Map',
      debugShowCheckedModeBanner: false,
    );
  }
}
