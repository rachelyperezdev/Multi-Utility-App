import 'package:http/http.dart' as http;
import 'dart:convert';

class GenderService {
  Future<String> getGender(String name) async {
    try {
      final url = 'https://api.genderize.io/?name=$name';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['gender'] ?? 'Género no identificado';
      } else {
        throw Exception('No se encontró el género');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
