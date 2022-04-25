import 'dart:io';

import 'package:flutter/material.dart';

class TorneoImage extends StatelessWidget {
  final String? url;
  const TorneoImage({Key? key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 200,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(child: getImage(url)),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() =>
      BoxDecoration(color: Colors.indigo, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5))
      ]);

  Widget getImage(String? picture) {
    if (picture == null)
      return const Image(
        image: AssetImage('assets/no-image.png'),
        fit: BoxFit.cover,
      );

    if (picture.startsWith('http'))
      return FadeInImage(
        image: NetworkImage(this.url!),
        placeholder: const AssetImage('assets/jar-loading.gif'),
        fit: BoxFit.cover,
      );

    return Image.file(
      File(picture),
      fit: BoxFit.cover,
    );
  }
}
