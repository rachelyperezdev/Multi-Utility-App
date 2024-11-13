import 'package:http/http.dart' as http;
import 'dart:convert';

class AgeService {
  Future<int> getAge(String name) async {
    try {
      final url = 'https://api.agify.io/?name=$name';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['age'] ?? 'Edad no identificada';
      } else {
        return 0;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
