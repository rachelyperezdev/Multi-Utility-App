import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HireMeView extends StatelessWidget {
  const HireMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Container(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/yo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(32),
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 350,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 230, 253),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 84, 124, 255),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'RACHELY PÉREZ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 231, 161),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () async {
                              const emailUrl =
                                  'mailto:rachely.perez.31@gmail.com';
                              if (await canLaunchUrl(Uri.parse(emailUrl))) {
                                await launchUrl(Uri.parse(emailUrl));
                              } else {
                                throw 'No se pudo acceder a $emailUrl';
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 121, 152, 255),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: Color.fromARGB(
                                              255, 255, 231, 161),
                                          size: 16,
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'rachely.perez.31@gmail.com',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 231, 161),
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () async {
                              const githubUrl =
                                  'https://github.com/rachelyperezdev';
                              if (await canLaunchUrl(Uri.parse(githubUrl))) {
                                await launchUrl(Uri.parse(githubUrl));
                              } else {
                                throw 'Could not launch $githubUrl';
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 121, 152, 255),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: const Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.github,
                                          color: Color.fromARGB(
                                              255, 255, 231, 161),
                                          size: 16,
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'rachelyperezdev',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 231, 161),
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () async {
                              const linkedinUrl =
                                  'https://www.linkedin.com/in/rachely-perez-dev';
                              if (await canLaunchUrl(Uri.parse(linkedinUrl))) {
                                await launchUrl(Uri.parse(linkedinUrl));
                              } else {
                                throw 'Could not launch $linkedinUrl';
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 121, 152, 255),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: const Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.linkedin,
                                          color: Color.fromARGB(
                                              255, 255, 231, 161),
                                          size: 16,
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'rachely-perez-dev',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 231, 161),
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 121, 152, 255),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              "Desarrolladora de Software competente en .NET Core y React. Comprometida en contribuir identificando soluciones a los objetivos establecidos.\nActualmente me encuentro aprendiendo tecnologías móviles.",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 231, 161),
                                fontSize: 14,
                                height: 2,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
