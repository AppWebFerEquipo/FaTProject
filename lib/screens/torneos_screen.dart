import 'package:flutter/material.dart';
import 'package:login/models/models.dart';
import 'package:login/routes/AnimationPageRoute.dart';
import 'package:login/routes/app_routes.dart';
import 'package:login/routes/tabnavigation.dart';
import 'package:login/services/services.dart';
import 'package:login/widgets/widgets.dart';
import 'package:login/screens/screens.dart';
import 'package:provider/provider.dart';

class TorneosHome extends StatefulWidget {
  const TorneosHome({Key? key}) : super(key: key);
  @override
  _TorneosHomeState createState() => _TorneosHomeState();
}

class _TorneosHomeState extends State<TorneosHome> {
  int home = 0;

  @override
  Widget build(BuildContext context) {
    final torneoService = Provider.of<TorneoService>(context);

    if (torneoService.isLoading) return LoadingTorneoScreen();
    int home = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Torneos'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              torneoService.selectedTorneo = new Torneos(
                fecha: DateTime.now(),
                disciplina: '',
                disponibilidad: false,
                equipos: 0,
                bases: '',
                costo: 0,
                rondas: 0,
                tipotorneo: '',
              );
              Navigator.push(
                  context, AnimationPageRoute(widget: ToneoEditar()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: torneoService.torneo.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            torneoService.selectedTorneo = torneoService.torneo[index].copy();
            Navigator.push(context, AnimationPageRoute(widget: ToneoEditar()));
          },
          child: TorneoCard(
            torneo: torneoService.torneo[index],
          ),
        ),
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
              label: tabItem.label,
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
}
