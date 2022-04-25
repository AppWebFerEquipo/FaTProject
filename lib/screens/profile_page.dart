import 'package:flutter/material.dart';
import 'package:login/routes/app_routes.dart';
import 'package:login/routes/tabnavigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int home = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Mi Perfil"),
        backgroundColor: Colors.blueGrey[300],
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: const [
                  0.5,
                  0.9
                ],
                    colors: [
                  Colors.blueGrey.shade600,
                  Colors.blueGrey.shade500
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      child: const Icon(
                        Icons.sports_soccer_rounded,
                        color: Colors.black,
                        size: 50.0,
                      ),
                      minRadius: 30.0,
                      backgroundColor: Colors.blueGrey[100],
                    ),
                    CircleAvatar(
                      minRadius: 60,
                      backgroundColor: Colors.blueGrey.shade300,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/Merida-FC.png"),
                        minRadius: 50,
                      ),
                    ),
                    CircleAvatar(
                      child: const Icon(
                        Icons.sports,
                        color: Colors.black,
                        size: 50.0,
                      ),
                      minRadius: 30.0,
                      backgroundColor: Colors.blueGrey[100],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "CF Mérida",
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                const Text(
                  "9993458921",
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.blueGrey.shade500,
                  child: const ListTile(
                    title: Text(
                      "12",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                    subtitle: Text(
                      "TORNEOS",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blueGrey.shade600,
                  child: const ListTile(
                    title: Text(
                      "24",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                    subtitle: Text(
                      "SERVICIOS",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const ListTile(
            title: Text(
              "Email",
              style: TextStyle(color: Colors.black, fontSize: 12.0),
            ),
            subtitle: Text(
              "FindingATournament@hotmail.com",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              "Teléfono",
              style: TextStyle(color: Colors.black, fontSize: 12.0),
            ),
            subtitle: Text(
              "9993458921",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              "Dirección",
              style: TextStyle(color: Colors.black, fontSize: 12.0),
            ),
            subtitle: Text(
              "Calle 68 #45 por 106 y 108 Dolores Otero",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              "Horarios",
              style: TextStyle(color: Colors.black, fontSize: 12.0),
            ),
            subtitle: Text(
              "Lunes a domingo de 12PM a 10PM",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          const Divider(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          for (final tabItem in TabNavigationItem.items)
            BottomNavigationBarItem(
              icon: tabItem.icon,
              label: tabItem.label.toString(),
            )
        ],
        currentIndex: home,
        onTap: (index) {
          setState(
            () {
              if (home == index) {
                Navigator.pushReplacementNamed(context, AppRoutes.profileRoute);
              } else {
                Navigator.pushReplacementNamed(context, AppRoutes.initialRoute);
              }
            },
          );
        },
      ),
    );
  }
}
