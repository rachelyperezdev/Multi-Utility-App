import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://cdn3d.iconscout.com/3d/premium/thumb/toolbox-3d-icon-download-in-png-blend-fbx-gltf-file-formats--tool-box-wrench-job-labour-day-pack-tools-equipment-icons-6855690.png',
            width: double.infinity,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Bienvenido a Toolbox',
            style: TextStyle(
                color: Color.fromARGB(255, 84, 124, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
