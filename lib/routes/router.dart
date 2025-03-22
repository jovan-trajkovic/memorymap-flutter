import 'package:go_router/go_router.dart';
import 'package:memory_map/screens/add_log_screen.dart';
import 'package:memory_map/screens/home_screen.dart';

import '../layout/shell_with_nav_bar.dart';

/*This code is used for making a go_router navigation while having a
* navigation bar at the bottom of the screen. Navigation destinations are
* stated as branches inside the StatefulShellBranch.
* This code can be reused in other projects, I'll just need to change the
* branches.*/

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => ShellWithNavBar(
        navigationShell: navigationShell
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: "/", builder: (context, state) => HomeScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/add_log",
              builder: (context, state) => AddLogScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
