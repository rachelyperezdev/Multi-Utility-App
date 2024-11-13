import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea_6/bloc/age/age_bloc.dart';
import 'package:tarea_6/bloc/age/age_event.dart';
import 'package:tarea_6/bloc/age/age_state.dart';

class AgeByNameView extends StatefulWidget {
  const AgeByNameView({super.key});

  @override
  AgeByNameViewState createState() => AgeByNameViewState();
}

class AgeByNameViewState extends State<AgeByNameView> {
  final TextEditingController _nameController = TextEditingController();

  void _predictAge() {
    final String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      context.read<AgeBloc>().add(PredictAge(name));
    }
  }

  @override
  void initState() {
    super.initState();
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
                  'PREDICE LA EDAD',
                  style: TextStyle(
                    color: Color.fromARGB(255, 84, 124, 255),
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'predice la edad de una persona de acuerdo a su nombre',
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
                        labelText: 'Ingrese un nombre. Ej: Manuel',
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
                      onPressed: _predictAge,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Text(
                        'predice la edad',
                        style: TextStyle(color: Color.fromARGB(255, 80, 63, 0)),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Edad:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 84, 124, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                BlocBuilder<AgeBloc, AgeState>(builder: (context, state) {
                  if (state is AgeLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is AgeSuccess) {
                    return Column(
                      children: [
                        Text(
                          '${state.message} (${state.age} años)',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 98, 110, 148),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        state.image
                      ],
                    );
                  } else if (state is AgeError) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
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
