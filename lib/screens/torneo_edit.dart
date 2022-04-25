import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/providers/torneos_form_provider.dart';
import 'package:login/screens/torneos_screen.dart';
import 'package:login/services/services.dart';
import 'package:login/userinterface/input_decorations.dart';
import 'package:login/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class ToneoEditar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final torneoService = Provider.of<TorneoService>(context);

    return ChangeNotifierProvider(
      create: (_) => TorneoFormProvider(torneoService.selectedTorneo),
      child: _TorneosScreenBody(torneoService: torneoService),
    );
  }
}

class _TorneosScreenBody extends StatelessWidget {
  const _TorneosScreenBody({
    Key? key,
    required this.torneoService,
  }) : super(key: key);

  final TorneoService torneoService;

  @override
  Widget build(BuildContext context) {
    final torneoForm = Provider.of<TorneoFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text('Editar Torneo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: torneoService.isSaving
                ? null
                : () async {
                    final String? imageUlr = await torneoService.uploadImage();

                    if (imageUlr != null) torneoForm.torneo.picture = imageUlr;
                    await torneoService.saveOrCreateTorneos(torneoForm.torneo);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TorneosHome(),
                        ));
                  },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _TorneoForm(),
            Stack(
              children: [
                TorneoImage(url: torneoService.selectedTorneo.picture),
                Positioned(
                    top: 20,
                    right: 20,
                    child: IconButton(
                      onPressed: () async {
                        final picker = new ImagePicker();
                        final PickedFile? pickedFile = await picker.getImage(
                            source: ImageSource.gallery, imageQuality: 100);
                        if (pickedFile == null) {
                          print('No selecciono una imagén');
                          return;
                        }
                        torneoService
                            .updateSelectedTorneoImage(pickedFile.path);
                      },
                      icon: const Icon(Icons.image,
                          size: 40, color: Colors.black),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TorneoForm extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    final torneoForm = Provider.of<TorneoFormProvider>(context);
    final torneo = torneoForm.torneo;
    List<String?> items = [
      'Fútbol',
      'Béisbol',
      'Básquetbol',
      'Natación',
      'Tenis',
      'Voleibol',
      'Boxeo',
      'Atletismo',
      'Golf',
      'Juego de pelota',
      'Taekwondo',
      'Karate',
      'Esgrima',
      'Gimnasia',
      'Handball',
      'Judo',
      'Softbol',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: torneoForm.formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'Horarios',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: Colors.indigo),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2)),
                  labelStyle: const TextStyle(color: Colors.grey),
                ),
                value: torneo.disciplina.isEmpty ? 'Fútbol' : torneo.disciplina,
                focusColor: Colors.white,
                iconDisabledColor: Colors.black,
                iconEnabledColor: Colors.black,
                dropdownColor: Colors.white,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items
                    .map((
                      items,
                    ) =>
                        DropdownMenuItem<String>(
                          value: items,
                          child: Text(
                            items!,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black),
                          ),
                        ))
                    .toList(),

                onChanged: (items) => torneo.disciplina = items!,
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: torneo.bases,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) => torneo.bases = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'Las bases son obligatorias';
                },
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Round Robin', labelText: 'Bases del torneo'),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: torneo.equipos.toString() == '0'
                    ? null
                    : '${torneo.equipos}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  torneo.equipos = int.parse(value);
                },
                keyboardType: TextInputType.number,
                validator: (value) {
                  final n = num.tryParse(value!);
                  if (n == 0 || n == null) {
                    return 'El numero de personas debe de ser mayor a 0';
                  }
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Capacidad de equipos',
                    labelText: 'Máximo de equipos'),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue:
                    torneo.rondas.toString() == '0' ? null : '${torneo.rondas}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  torneo.rondas = int.parse(value);
                },
                keyboardType: TextInputType.number,
                validator: (value) {
                  final n = num.tryParse(value!);
                  if (n == 0 || n == null) {
                    return 'El numero de rondas debe de ser mayor a 0';
                  }
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Cantidad de Rondas',
                    labelText: 'Cantidad de Rondas'),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue:
                    torneo.costo.toString() == '0' ? null : '${torneo.costo}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  torneo.costo = int.parse(value);
                },
                keyboardType: TextInputType.number,
                validator: (value) {
                  final n = num.tryParse(value!);
                  if (n == 0 || n == null) {
                    return 'El costo debe ser mayor a 0';
                  }
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Precio por equipo',
                    labelText: 'Precio por equipo'),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: torneo.tipotorneo,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) => torneo.tipotorneo = value,
                validator: (value) {
                  if (value == null || value.length < 0)
                    return 'El tipo de torneo es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Una eliminación', labelText: 'Tipo de torneo'),
              ),
              const SizedBox(height: 30),
              DateTimeField(
                format: format,
                onShowPicker: (context, currentValue) async {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    fieldHintText: '2022-10-10 20:20',
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
                decoration: InputDecorations.authInputDecoration(
                    hintText: '2022-10-10', labelText: 'Fecha del Reporte'),
                initialValue: torneo.fecha,
              ),
              const SizedBox(height: 30),
              SwitchListTile.adaptive(
                  value: torneo.disponibilidad,
                  title: const Text(
                    'Disponibilidad de Equipos',
                    style: TextStyle(color: Colors.black),
                  ),
                  activeColor: Colors.indigo,
                  onChanged: torneoForm.updateAvailability),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blueGrey,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5)
        ],
      );

/*   setState(String Function() param0) {}
} */
}
