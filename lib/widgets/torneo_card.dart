import 'package:flutter/material.dart';
import 'package:login/models/models.dart';
import 'package:login/screens/torneo_edit.dart';

class TorneoCard extends StatelessWidget {
  final Torneos torneo;

  const TorneoCard({Key? key, required this.torneo}) : super(key: key);

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
              title: Text(torneo.disciplina),
              subtitle: Text('Fecha ${torneo.fecha.toString()}'),
              trailing: _EquiposMax(
                torneo.equipos,
              ),
            ),
            Stack(
              children: [
                _BackgroundImage(torneo.picture),
                if (torneo.disponibilidad)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: _Disponibilidad(),
                  ),
              ],
            ),
            ButtonBar(
              children: [
                Text('Precio ${torneo.costo.toString()}'),
                TextButton(
                  child: const Text('EDITAR'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToneoEditar(),
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

class _Disponibilidad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Disponible',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      width: 75,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
      ),
    );
  }
}

class _EquiposMax extends StatelessWidget {
  final int equipos;
  const _EquiposMax(this.equipos);

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
                  child: Icon(Icons.groups, size: 24, color: Colors.black),
                ),
                TextSpan(
                  text: ('$equipos'),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 23,
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
      ),
    );
  }
}

class _TorneoDetails extends StatelessWidget {
  final String title;
  final String subTitle;

  const _TorneoDetails({required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        color: Colors.indigo,
      );
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
