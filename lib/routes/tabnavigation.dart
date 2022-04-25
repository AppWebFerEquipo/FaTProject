import 'package:flutter/material.dart';
import 'package:login/screens/screens.dart';

class TabNavigationItem {
  final Widget page;
  final String label;
  final Icon icon;

  TabNavigationItem({
    required this.page,
    required this.label,
    required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomeScreen(),
          icon: const Icon(Icons.home),
          label: 'Home',
        ),
/*         TabNavigationItem(
          page: ServicioHome(),
          icon: const Icon(Icons.sports_volleyball),
          title: const Text("Servicios"),
        ), */
        TabNavigationItem(
          page: ProfilePage(),
          icon: const Icon(Icons.person),
          label: 'Perfil',
        ),
      ];
}
