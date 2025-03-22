import 'package:go_router/go_router.dart';
import 'package:memory_map/screens/add_log_screen.dart';
import 'package:memory_map/screens/home_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen()
    ),
    GoRoute(
      path: '/addLog',
      builder: (context, state) => AddLogScreen()
    ),
  ],
);
