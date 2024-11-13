import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea_6/bloc/universities/university_bloc.dart';
import 'package:tarea_6/bloc/universities/university_event.dart';
import 'package:tarea_6/bloc/universities/university_state.dart';
import 'package:url_launcher/url_launcher.dart';

class UniversityByCountryView extends StatefulWidget {
  const UniversityByCountryView({super.key});

  @override
  UniversityByCountryViewState createState() => UniversityByCountryViewState();
}

class UniversityByCountryViewState extends State<UniversityByCountryView> {
  final TextEditingController _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _launchUrl(String url) async {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = 'https://$url';
    }

    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se pudo abrir $url'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _fetchUniversities() {
    final String country = _countryController.text.trim();
    if (country.isNotEmpty) {
      context.read<UniversityBloc>().add(FetchUniversities(country));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'UNIVERSIDADES DE ACUERDO AL PAÍS',
                  style: TextStyle(
                    color: Color.fromARGB(255, 84, 124, 255),
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 2),
                const Text(
                  'ingresa el país (en inglés) y determina las universidades que allí se encuentran',
                  style: TextStyle(
                      color: Color.fromARGB(255, 98, 110, 148), fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _countryController,
                    decoration: const InputDecoration(
                        labelText:
                            'Ingrese un país (en inglés). Ej: Dominican Republic',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 98, 110, 148)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 98, 110, 148)))),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: _fetchUniversities,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'obtén las universidades',
                      style: TextStyle(color: Color.fromARGB(255, 80, 63, 0)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Universidades:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 84, 124, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                BlocBuilder<UniversityBloc, UniversityState>(
                  builder: (context, state) {
                    if (state is UniversityLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is UniversitySuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.universities.length,
                        itemBuilder: (context, index) {
                          final university = state.universities[index];
                          return Card(
                            color: const Color.fromARGB(255, 238, 242, 255),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              title: Text(
                                university.name,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 84, 124, 255)),
                              ),
                              subtitle: Text(
                                university.domain,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 98, 110, 148)),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  _launchUrl(university.webPage);
                                },
                                icon: const Icon(
                                  Icons.link,
                                  color: Color.fromARGB(255, 84, 124, 255),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is UniversityError) {
                      return Center(
                        child: Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
