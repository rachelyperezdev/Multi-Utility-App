import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tarea_6/models/university.dart';

class UniversityService {
  Future<List<University>> getUniversities(String country) async {
    try {
      final url = 'http://universities.hipolabs.com/search?country=$country';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => University.fromJson(json)).toList();
      } else {
        throw Exception('Fallo al obtener las universidades');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
