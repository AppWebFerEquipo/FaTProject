import 'package:flutter/material.dart';
import 'package:login/models/models.dart';

import 'package:login/screens/servicio_screen.dart';

class ServicioCard extends StatelessWidget {
  final Servicio servicio;

  const ServicioCard({Key? key, required this.servicio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        padding: const EdgeInsets.symmetric(),
        decoration: _cardBorders(),
        child: Column(
          children: [
            ListTile(
              title: Text(servicio.name),
              subtitle: Text(servicio.horario),
              trailing: _PersonasMax(
                servicio.personas,
              ),
            ),
            Stack(
              children: [
                _BackgroundImage(servicio.picture),
                if (servicio.discapacitados)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: _Nodiscapacitados(),
                  ),
              ],
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('EDITAR'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServicioScreen(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() =>
      const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
      ]);
}

class _Nodiscapacitados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.wheelchair_pickup_rounded, size: 20),
        ),
      ),
      width: 75,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
    );
  }
}

class _PersonasMax extends StatelessWidget {
  final int personas;
  const _PersonasMax(this.personas);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: RichText(
            text: TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(Icons.groups_sharp, size: 24),
                ),
                TextSpan(
                  text: ('$personas'),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
      width: 80,
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: url == null
            ? const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
