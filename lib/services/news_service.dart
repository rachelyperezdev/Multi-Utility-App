import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService {
  String baseUrl = "https://design-milk.com/wp-json/wp/v2/posts";

  Future<List<dynamic>> getNews() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        return data;
      } else {
        throw Exception("Error al cargar las noticias");
      }
    } catch (e) {
      throw Exception("Error al obtener las noticias");
    }
  }
}
