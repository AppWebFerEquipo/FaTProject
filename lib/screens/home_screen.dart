import 'package:flutter/material.dart';

import 'package:login/routes/app_routes.dart';
import 'package:login/routes/tabnavigation.dart';
import 'package:login/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int home = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'FaT',
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          _buildHeader(context),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ServicioHome()));
                  },
                  child: const cardServicios()),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TorneosHome()));
                  },
                  child: const cardtorneos()),
            ],
          ),
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
                Navigator.pushReplacementNamed(context, AppRoutes.initialRoute);
              } else {
                Navigator.pushReplacementNamed(context, AppRoutes.profileRoute);
              }
            },
          );
        },
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 25.0),
        height: 240.0,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 5.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Text(
                      "Kukulkan",
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text("9993458921"),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: const Text(
                                "302",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("Servicios".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12.0)),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text(
                                "200",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("Seguidores".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12.0)),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text(
                                "120",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("Torneos".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12.0)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Material(
                  elevation: 5.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage("assets/Merida-FC.png"),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class cardServicios extends StatelessWidget {
  const cardServicios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
      child: (Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black,
        elevation: 4,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/sports.png'),
                alignment: Alignment.bottomCenter,
                scale: 4.5,
                opacity: 50),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 45, 59, 212),
                Color.fromARGB(255, 146, 179, 251)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          width: 180,
          height: 220,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: const [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ListTile(
                    title: Text(
                      'Mis Servicios',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class cardtorneos extends StatelessWidget {
  const cardtorneos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: (Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black,
        elevation: 4,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/trophy.png'),
                alignment: Alignment.bottomCenter,
                scale: 4.5,
                opacity: 50),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 2, 107, 198),
                Color.fromARGB(255, 164, 215, 248)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          width: 180,
          height: 220,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 5, bottom: 15, top: 15),
            child: Row(
              children: const [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ListTile(
                    title: Text(
                      'Mis Torneos',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
