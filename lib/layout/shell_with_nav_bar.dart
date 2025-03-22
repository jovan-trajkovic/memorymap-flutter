import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/*This is the widget ShellWithNavBar, where the shell is the content being
* shown on the main part of the screen, and having the bottom navigation bar
* on the lower part. This makes us able to change the content in the body
* of the scaffold, without changing and redrawing the nav bar. It also
* preserves the state of the screens when they are changed. Destinations are
* linked to the branches in the router, in order they are listed.
* Code is reusable, I just need to change the destinations.*/

class ShellWithNavBar extends StatelessWidget {
  const ShellWithNavBar({required this.navigationShell, Key? key,}): super(key: key ?? const ValueKey<String>('ShellWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        indicatorColor: Theme.of(context).primaryColor,
        destinations: [
          NavigationDestination(icon: Icon(Icons.list), label: "Home"),
          NavigationDestination(icon: Icon(Icons.add_box_outlined), label: "Add Log"),
          NavigationDestination(icon: Icon(Icons.map_outlined), label: "Map"),
        ],
      ),
    );
  }
}
