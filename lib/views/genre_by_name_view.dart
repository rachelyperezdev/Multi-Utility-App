import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea_6/bloc/gender/gender_bloc.dart';
import 'package:tarea_6/bloc/gender/gender_event.dart';
import 'package:tarea_6/bloc/gender/gender_state.dart';
import 'package:tarea_6/services/gender_service.dart';

class GenreByNameView extends StatefulWidget {
  const GenreByNameView({super.key});

  @override
  GenreByNameViewState createState() => GenreByNameViewState();
}

class GenreByNameViewState extends State<GenreByNameView> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _predictGenre() {
    final name = _nameController.text;
    if (name.isNotEmpty) {
      context.read<GenderBloc>().add(PredictGender(name));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'PREDICE EL GÉNERO',
                  style: TextStyle(
                    color: Color.fromARGB(255, 84, 124, 255),
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'predice el género de una persona de acuerdo a su nombre',
                  style: TextStyle(
                      color: Color.fromARGB(255, 98, 110, 148), fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        labelText: 'Ingrese un nombre. Ej: Isa',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 98, 110, 148)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 98, 110, 148)))),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                      onPressed: _predictGenre,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Text(
                        'predice el género',
                        style: TextStyle(color: Color.fromARGB(255, 80, 63, 0)),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Género:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 84, 124, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                BlocBuilder<GenderBloc, GenderState>(builder: (context, state) {
                  if (state is GenderLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is GenderSuccess) {
                    return Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                          color: state.color,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        state.gender,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (state is GenderError) {
                    return Text(
                      state.message,
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
