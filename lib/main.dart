import 'package:flutter/material.dart';
import 'package:memory_map/database/memory_map_database.dart';
import 'package:memory_map/routes/router.dart';
import 'package:provider/provider.dart';
import 'log_provider.dart';

/*ChangeNotifierProvider makes the provider and listens for changes,
* updating the UI elements that depend on the provider.
* Provider is usually always initialized like this.
*/

void main() {
  final memoryMapDatabase = MemoryMapDatabase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LogProvider(database: memoryMapDatabase)),
      ],
      child: MyApp(),
    ),
  );
  //runApp(const MyApp());
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
