import '../models/item_menu.dart';
import '../screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initialRoute = 'HomeScreen';
  static const String loginscreen = 'login';
  static const String profileRoute = 'profile';
  static const String serviciosloading = 'loading';
  static const String registerRoute = 'Register';
  static const String servicioscreen = 'servicio';
  static const String servicioscreenedit = 'servicioedit';
  static const String torneoscreen = 'torneo';
  static const String torneosscreenedit = 'servicioedit';
  static const String registerscreen = 'register';

  static final menuOptions = <ItemMenu>[
    ItemMenu(
      label: 'HomeScreen',
      route: initialRoute,
      screen: const HomeScreen(),
    ),
    ItemMenu(
      label: 'login',
      route: loginscreen,
      screen: Login(),
    ),
    ItemMenu(
      label: 'loading',
      route: serviciosloading,
      screen: LoadingScreen(),
    ),
    ItemMenu(
      label: 'profile',
      route: profileRoute,
      screen: ProfilePage(),
    ),
    ItemMenu(
      label: 'servicio',
      route: servicioscreen,
      screen: ServicioHome(),
    ),
    ItemMenu(
      label: 'servicioedit',
      route: servicioscreenedit,
      screen: ServicioScreen(),
    ),
    ItemMenu(
      label: 'torneo',
      route: torneoscreen,
      screen: TorneosHome(),
    ),
    ItemMenu(
      label: 'servicioedit',
      route: torneosscreenedit,
      screen: ToneoEditar(),
    ),
    ItemMenu(
      label: 'register',
      route: registerscreen,
      screen: Register(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final item in menuOptions) {
      appRoutes.addAll({item.route: (BuildContext context) => item.screen});
    }
    return appRoutes;
  }
}
